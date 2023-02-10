tool
extends PanelContainer

enum Direction {
	UP,
	DOWN
}

###########################
## SETTINGS
###########################

export (bool) var autoShow = true
export (String, FILE, "*.json") var customLayoutFile = null
export (StyleBoxFlat) var styleBackground = null
export (StyleBoxFlat) var styleHover = null
export (StyleBoxFlat) var stylePressed = null
export (StyleBoxFlat) var styleNormal = null
export (StyleBoxFlat) var styleSpecialKeys = null
export (DynamicFont) var font = null
export (Color) var fontColor = Color(1,1,1)
export (Color) var fontColorHover = Color(1,1,1)
export (Color) var fontColorPressed = Color(1,1,1)

###########################
## SIGNALS
###########################

signal visibilityChanged
signal layoutChanged

###########################
## PANEL 
###########################

func _enter_tree():
	get_tree().get_root().connect("size_changed", self, "size_changed")
	_initKeyboard()

#func _process(delta):
#	pass

func _input(event):
	_updateAutoDisplayOnInput(event)
	if keyboardVisible:
		if not sendingEvent:
			if event is InputEventKey or event is InputEventJoypadButton or event is InputEventJoypadMotion:
				get_tree().set_input_as_handled()
				_handleKeyEvents(event)
		elif event is InputEventKey and event.scancode == KEY_ENTER and isKeyboardFocusObject(focusObject):
			_hideKeyboard()

func size_changed():
	if autoShow:
		_hideKeyboard()

###########################
## INIT
###########################
var KeyboardButton
var KeyListHandler

var layouts = []
var keys = []
var layoutKeys = {}
var focusKeys = null
var capslockKeys = []
var uppercase = false

var focusedKeyX = 0
var focusedKeyY = 0
var keyboardVisible = false
var sendingEvent = false

var tweenPosition
var tweenSpeed = .2

func _initKeyboard():

	if customLayoutFile == null:
		var defaultLayout = preload("default_layout.gd").new()
		_createKeyboard(defaultLayout.data)
	else:
		_createKeyboard(_loadJSON(customLayoutFile))
	
	tweenPosition = Tween.new()
	add_child(tweenPosition)
	
	if autoShow:
		_hideKeyboard()


###########################
## HIDE/SHOW
###########################

var focusObject = null

func show():
	_showKeyboard()
	
func hide():
	_hideKeyboard()

var released = true
func _updateAutoDisplayOnInput(event):
	if autoShow == false:
		return
	
	if event is InputEventMouseButton:
		released = !released
		if released == false:
			return
		
		if focusObject != null:
			var clickOnInput = Rect2(focusObject.rect_global_position,focusObject.rect_size).has_point(get_global_mouse_position())
			var clickOnKeyboard = Rect2(rect_global_position,rect_size).has_point(get_global_mouse_position())
			
			if clickOnInput:
				if isKeyboardFocusObject(focusObject):
					_showKeyboard()
			elif not clickOnKeyboard:
				_hideKeyboard()

func _hideKeyboard(keyData=null,x=null,y=null):
	tweenPosition.interpolate_property(self,"rect_position",rect_position, Vector2(rect_position.x,get_viewport().get_visible_rect().size.y + 10), tweenSpeed, Tween.TRANS_SINE, Tween.EASE_OUT)
	tweenPosition.start()
	
	_setCapsLock(false)
	keyboardVisible = false
	emit_signal("visibilityChanged",keyboardVisible)


func _showKeyboard(keyData=null,x=null,y=null):
	tweenPosition.interpolate_property(self,"rect_position",rect_position, Vector2(rect_position.x,get_viewport().get_visible_rect().size.y-rect_size.y), tweenSpeed, Tween.TRANS_SINE, Tween.EASE_OUT)
	tweenPosition.start()
	focusObject = get_focus_owner()
	focusKey(0,0)
	keyboardVisible = true
	emit_signal("visibilityChanged",keyboardVisible)


func _handleKeyEvents(event):
	# Selection
	if event.is_action_pressed("ui_left"):
		focusKey(focusedKeyX - 1, focusedKeyY)
	elif event.is_action_pressed("ui_right"):
		focusKey(focusedKeyX + 1, focusedKeyY)
	elif event.is_action_pressed("ui_up"):
		focusKeyDir(Direction.UP)
	elif event.is_action_pressed("ui_down"):
		focusKeyDir(Direction.DOWN)
	elif event.is_action_pressed("ui_accept"):
		focusKeys[focusedKeyY][focusedKeyX].pressing = true
	elif event.is_action_released("ui_accept"):
		focusKeys[focusedKeyY][focusedKeyX].pressing = false
	elif event.is_action_pressed("ui_cancel"):
		_hideKeyboard()

###########################
##  KEY LAYOUT
###########################

var prevPrevLayout = null
var previousLayout = null
var currentLayout = null

func setActiveLayoutByName(name):
	for layout in layouts:
		if layout.hint_tooltip == str(name):
			_showLayout(layout)
		else:
			_hideLayout(layout)

func _showLayout(layout):
	layout.show()
	currentLayout = layout
	# Old key, unfocus
	var key = focusKeys[focusedKeyY][focusedKeyX]
	key.focused = false
	focusKeys = layoutKeys[layout]
	# Focus new key on different layout
	focusedKeyX = 0
	focusedKeyY = 0
	focusKeys[focusedKeyY][focusedKeyX].focused = true


func _hideLayout(layout):
	layout.hide()


func _switchLayout(keyData,x,y):
	yield(get_tree(), "idle_frame")
	prevPrevLayout = previousLayout
	previousLayout = currentLayout
	emit_signal("layoutChanged", keyData.get("layout-name"))
	
	for layout in layouts:
		_hideLayout(layout)
	
	if keyData.get("layout-name") == "PREVIOUS-LAYOUT":
		if prevPrevLayout != null:
			_showLayout(prevPrevLayout)
			return
	
	for layout in layouts:
		if layout.hint_tooltip == keyData.get("layout-name"):
			_showLayout(layout)
			return
	
	_setCapsLock(false)

###########################
## KEY EVENTS
###########################

func _setCapsLock(value):
	uppercase = value
	for key in capslockKeys:
		if value:
			if key.get_draw_mode() != BaseButton.DRAW_PRESSED:
				key.pressed = !key.pressed
		else:
			if key.get_draw_mode() == BaseButton.DRAW_PRESSED:
				key.pressed = !key.pressed
				
	for key in keys:
		key.changeUppercase(value)


func _triggerUppercase(keyData,x,y):
	uppercase = !uppercase
	_setCapsLock(uppercase)


func _keyDown(keyData,x,y):
	focusKey(x,y)

func _keyReleased(keyData,x,y):
	
	if keyData.has("output"):
		var keyValue = keyData.get("output")
		
		###########################
		## DISPATCH InputEvent 
		###########################
		
		var inputEventKey = InputEventKey.new()
		inputEventKey.shift = uppercase
		inputEventKey.alt = false
		inputEventKey.meta = false
		inputEventKey.command = false
		inputEventKey.pressed = true
		
		var keyUnicode = KeyListHandler.getUnicodeFromString(keyValue)
		if uppercase==false and KeyListHandler.hasLowercase(keyValue):
			keyUnicode +=32
		inputEventKey.unicode = keyUnicode
		inputEventKey.scancode = KeyListHandler.getScancodeFromString(keyValue)

		sendingEvent = true
		Input.parse_input_event(inputEventKey)
		yield(get_tree(), "idle_frame")
		sendingEvent = false
		
		###########################
		## DISABLE CAPSLOCK AFTER 
		###########################
		_setCapsLock(false)


###########################
## CONSTRUCT KEYBOARD
###########################

func _setKeyStyle(styleName, key, style):
	if style != null:
		key.set('custom_styles/'+styleName, style)

func _createKeyboard(layoutData):
	if layoutData == null:
		print("ERROR. No layout file found")
		return
	
	KeyListHandler = preload("keylist.gd").new()
	KeyboardButton = preload("keyboard_button.gd")
	
	var ICON_DELETE = preload("icons/delete.png")
	var ICON_SHIFT = preload("icons/shift.png")
	var ICON_LEFT = preload("icons/left.png")
	var ICON_RIGHT = preload("icons/right.png")
	var ICON_HIDE = preload("icons/hide.png")
	var ICON_ENTER = preload("icons/enter.png")
	
	var data = layoutData
	
	if styleBackground != null:
		set('custom_styles/panel', styleBackground)
	
	var index = 0
	for layout in data.get("layouts"):

		var layoutContainer = PanelContainer.new()
		
		if styleBackground != null:
			layoutContainer.set('custom_styles/panel', styleBackground)
		
		# SHOW FIRST LAYOUT ON DEFAULT
		if index > 0:
			layoutContainer.hide()
		else:
			currentLayout = layoutContainer
		
		layoutContainer.hint_tooltip = layout.get("name")
		layouts.push_back(layoutContainer)
		add_child(layoutContainer)
		
		var baseVbox = VBoxContainer.new()
		baseVbox.size_flags_horizontal = SIZE_EXPAND_FILL
		baseVbox.size_flags_vertical = SIZE_EXPAND_FILL
		
		var loopLayoutKeys = []
		layoutKeys[layoutContainer] = loopLayoutKeys
		if focusKeys == null:
			focusKeys = layoutKeys[layoutContainer]

		for row in layout.get("rows"):
			var focusRowKeys = []
			loopLayoutKeys.push_back(focusRowKeys)

			var keyRow = HBoxContainer.new()
			keyRow.size_flags_horizontal = SIZE_EXPAND_FILL
			keyRow.size_flags_vertical = SIZE_EXPAND_FILL
			
			for key in row.get("keys"):
				var newKey = KeyboardButton.new(key)
				newKey.id_x = focusRowKeys.size()
				newKey.id_y = loopLayoutKeys.size()-1
				focusRowKeys.push_back(newKey)
				
				_setKeyStyle("normal",newKey, styleNormal)
				_setKeyStyle("hover",newKey, styleHover)
				_setKeyStyle("pressed",newKey, stylePressed)
					
				if font != null:
					newKey.set('custom_fonts/font', font)
				if fontColor != null:
					newKey.set('custom_colors/font_color', fontColor)
					newKey.set('custom_colors/font_color_hover', fontColorHover)
					newKey.set('custom_colors/font_color_pressed', fontColorPressed)
					newKey.set('custom_colors/font_color_disabled', fontColor)
				
				newKey.connect("down",self,"_keyDown")
				newKey.connect("released",self,"_keyReleased")
				
				if key.has("type"):
					if key.get("type") == "switch-layout":
						newKey.connect("released",self,"_switchLayout")
						_setKeyStyle("normal",newKey, styleSpecialKeys)
					elif key.get("type") == "special":
						_setKeyStyle("normal",newKey, styleSpecialKeys)
					elif key.get("type") == "special-shift":
						newKey.connect("released",self,"_triggerUppercase")
						newKey.toggle_mode = true
						capslockKeys.push_back(newKey)
						_setKeyStyle("normal",newKey, styleSpecialKeys)
					elif key.get("type") == "special-hide-keyboard":
						newKey.connect("released",self,"_hideKeyboard")
						_setKeyStyle("normal",newKey, styleSpecialKeys)
				
				# SET ICONS
				if key.has("display-icon"):
					var iconData = str(key.get("display-icon")).split(":")
					# PREDEFINED
					if str(iconData[0])=="PREDEFINED":
						if str(iconData[1])=="DELETE":
							newKey.setIcon(ICON_DELETE)
						elif str(iconData[1])=="SHIFT":
							newKey.setIcon(ICON_SHIFT)
						elif str(iconData[1])=="LEFT":
							newKey.setIcon(ICON_LEFT)
						elif str(iconData[1])=="RIGHT":
							newKey.setIcon(ICON_RIGHT)
						elif str(iconData[1])=="HIDE":
							newKey.setIcon(ICON_HIDE)
						elif str(iconData[1])=="ENTER":
							newKey.setIcon(ICON_ENTER)
					# CUSTOM
					if str(iconData[0])=="res":
						print(key.get("display-icon"))
						var texture = load(key.get("display-icon"))
						newKey.setIcon(texture)
						
					if fontColor != null:
						newKey.setIconColor(fontColor)
				
				keyRow.add_child(newKey)
				keys.push_back(newKey)
				
			baseVbox.add_child(keyRow)
		
		layoutContainer.add_child(baseVbox)
		index+=1
	

###########################
## LOAD SETTINGS
###########################

func _loadJSON(filePath):
	var content = JSON.parse(_loadFile(filePath))
	
	if content.error == OK:
		return content.result
	else:
		print("!JSON PARSE ERROR!")
		return null


func _loadFile(filePath):
	var file = File.new()
	var error = file.open(filePath, file.READ)
	
	if error != 0:
		print("Error loading File. Error: "+str(error))
	
	var content = file.get_as_text()
	file.close()
	return content


###########################
## HELPER
###########################

func isKeyboardFocusObjectCompleteOnEnter(focusObject):
	if focusObject.get_class() == "LineEdit":
		return true
	return false

func isKeyboardFocusObject(focusObject):
	if focusObject.get_class() == "LineEdit" or focusObject.get_class() == "TextEdit":
		return true
	return false

func focusKey(x, y):
	# Unfocus previous key
	var key = focusKeys[focusedKeyY][focusedKeyX]
	key.focused = false
	if x != focusedKeyX or y != focusedKeyY:
		key.pressing = false
	
	if y < 0:
		y = focusKeys.size() - 1
	elif y >= focusKeys.size():
		y = 0
	if x < 0:
		x = focusKeys[y].size() - 1
	elif x >= focusKeys[y].size():
		x = 0

	# Focus new key
	focusedKeyX = x
	focusedKeyY = y
	focusKeys[focusedKeyY][focusedKeyX].focused = true

func focusKeyDir(dir):
	var currKey = focusKeys[focusedKeyY][focusedKeyX]
	var center = currKey.rect_global_position + currKey.rect_size / 2
	
	var idx = focusedKeyY + 1 if dir == Direction.DOWN else focusedKeyY - 1
	if idx == -1:
		idx = focusKeys.size()-1
	elif idx == focusKeys.size():
		idx = 0
	for key in focusKeys[idx]:
		var left_pos = key.rect_global_position.x
		var right_pos = left_pos + key.rect_size.x
		if (dir == Direction.UP and right_pos > center.x) or \
			(dir == Direction.DOWN and left_pos > center.x) or \
			(left_pos <= center.x and center.x <= right_pos):
			focusKey(key.id_x, key.id_y)
			return
