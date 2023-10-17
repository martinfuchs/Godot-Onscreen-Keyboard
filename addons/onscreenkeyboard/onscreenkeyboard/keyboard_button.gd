extends Button

var keyData

signal released
signal down

var iconTexRect

func _enter_tree():
	pass

func _ready():
	pass # Replace with function body.
	
func _init(_keyData):
	keyData = _keyData
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)
	item_rect_changed.connect(_on_item_rect_changed)
	
	size_flags_horizontal = SIZE_EXPAND_FILL
	size_flags_vertical = SIZE_EXPAND_FILL
	
	focus_mode = FOCUS_NONE
	
	if keyData.has("display"):
		text = keyData.get("display")

	if keyData.has("stretch-ratio"):
		size_flags_stretch_ratio = keyData.get("stretch-ratio")


func setIconColor(color):
	if iconTexRect != null:
		iconTexRect.modulate = color

func setIcon(texture):
	iconTexRect = TextureRect.new()
	iconTexRect.ignore_texture_size = true
	iconTexRect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	iconTexRect.texture = texture
	add_child(iconTexRect)


func changeUppercase(value):
	if value:
		if keyData.has("display-uppercase"):
			text = keyData.get("display-uppercase")
	else:
		if keyData.has("display"):
			text = keyData.get("display")

func _on_item_rect_changed():
	if iconTexRect != null:
		iconTexRect.size = size

func _on_button_up():
	released.emit(keyData)
	release_focus()
	
func _on_button_down():
	down.emit(keyData)
