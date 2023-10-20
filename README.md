![Screenshot](Screenshot.png "Screenshot")

# Usage
Onscreen keyboard for godot. Displayed as soon as LineEdit or TextEdit are in focus.

# Installation
- install via godot asset library: https://godotengine.org/asset-library/asset/1328
- activate plugin: Project Settings -> Plugins -> Onscreen Keyboard
- create node: Create New Node -> OnscreenKeyboard

# Custom styles
Select your OnscreenKeyboard object and apply your custom styles and font via inspector. (You can find some default dark-flat-like-styles inside the plugin/customize/styles folder)

# Custom key-layouts
You can find some layouts inside plugin/customize/keyboardLayouts. 

!Dont forget to add *.json to your export resources. -> Export -> Resources -> Filters to export non-resource ...

# Create key-layouts

## Assisted creation in gdscript

The function `make_row([], "", [])` which can be inherited from `KeyboardLayout` (`keyboard_layout.gd`) generates a row semi-automatically. The second argument is a string of symbols, such as "qwertyuiop[]" or "asdfghjkl;'\".
To the left and right of these symbols you can add custom special keys using the other arguments. 

## Key values

### "type"
define type of the key-button
types are: ```char, special, special-shift and switch-layout```

#### type: char
every key-release triggers value for key "output" with current uppercase state. ("output" value always in uppercase)
all usable output-values can be found in keylist.gd

```
{
	"type": "char",
	"output": "E",
	"display": "e",
	"display-uppercase": "E"
}
```
Since the creation of these is repetitive the function `generate_character_data()` can take care of that. You can even generate data for a string of characters with `generate_characters_data()`. These functions are also used by `make_row()`.

#### type: special
applies optional custom-style for special-keys (see: set custom key-layouts)
every key-release triggers value for key "output" with current uppercase state. ("output" value always in uppercase)
all usable output-values can be found in keylist.gd

```
{
	"type": "special",
	"output": "Return",
	"display": "Enter",
}
```

#### type: special-shift
triggers shift-function on key-release.

```
{
	"type": "special-shift",
	"display-icon": "PREDEFINED:SHIFT",
	"stretch-ratio": 1.5
}
```

#### type: switch-layout
use this type to create a button able to toggle the visible layout (eg. multi language keyboards). toggles layouts with same ```name``` in ```layout-name``` 
 (```"layout-name": "PREVIOUS-LAYOUT"``` displays the previous layout on key-release.)
 (see .json structure)
```
{
	"type": "switch-layout",
	"layout-name": "special-characters",
	"display": "&123"
}
```


### "output"
every key-release triggers value for key "output" with current uppercase state. ("output" value always in uppercase)
all usable output-values can be found in keylist.gd

### "display"
visible string if lowercase is active

### "display-uppercase"
visible string if uppercase is active

### "stretch-ratio"
float value. set this above 1 if you want to stretch the visible key width, or below 1 to minimize it.

### "display-icon"

#### use predefined key-icons: 

use parameter "PREDEFINED" with SHIFT, LEFT, RIGHT, HIDE or DELETE

```
"display-icon": "PREDEFINED:SHIFT"
```

#### use custom key-icons:

use your custom icon directory (inside your project resources)
```
"display-icon": "res://test.png"
```

## .json structure
A file can define multiple layouts. Each layout is defined by rows and key values. 

```
{
	"debug": false,
	"layouts": [
		{
		"name": "layout-1",
		"rows": [
				{
					"keys": [
						{
						 ...
						},
						{
						 ...
						},
						{
						 ...
						},
					]
				},
				{
					"keys": [
						{
						 ...
						},
						{
						 ...
						},
						{
							"type": "switch-layout",
							"layout-name": "layout-2",
							"display": "display layout 2"
						}
					]
				}
			]
		},
		{
		"name": "layout-2",
		"rows": [
				{
					"keys": [
						{
						 ...
						},
						{
						 ...
						},
						{
						 ...
						},
					]
				},
				{
					"keys": [
						{
						 ...
						},
						{
						 ...
						},
						{
							"type": "switch-layout",
							"layout-name": "layout-1",
							"display": "display layout 1"
						}
					]
				}
			]
		}
	]
}
```
