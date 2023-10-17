extends "keyboard_layout.gd"

func _init():
	data = {
		"debug": false,
		"layouts": [
		{
			"name": "standart-characters",
			"rows": [
			make_row(
				[],
				"qwertyuiop",
				[
					{
						"output": "Backspace",
						"display-icon": "PREDEFINED:DELETE",
						"stretch-ratio": 1.5
					}
				]
			),
			make_row(
				[],
				"asdfghjkl",
				[{
					"output": "Return",
					"display": "Enter",
					"stretch-ratio": 1.5
				}]
			),
			make_row(
				[{
					"type": "special-shift",
					"display-icon": "PREDEFINED:SHIFT",
					"stretch-ratio": 1.5
				}],
				"zxcvbnm",
				[{
					"type": "special-shift",
					"display-icon": "PREDEFINED:SHIFT",
					"stretch-ratio": 2
				}]
			),
			{
				"keys": [
				{
					"type": "switch-layout",
					"layout-name": "special-characters",
					"display": "&123",
					"stretch-ratio": 1.5
				},
				{
					"type": "char",
					"output": ",",
					"display": ","
				},
				{
					"type": "char",
					"output": "Space",
					"stretch-ratio": 5
				},
				{
					"type": "char",
					"output": ".",
					"display": "."
				},
				{
					"type": "special",
					"output": "LeftArrow",
					"display-icon": "PREDEFINED:LEFT"
				},
				{
					"type": "special",
					"output": "RightArrow",
					"display-icon": "PREDEFINED:RIGHT"
				},
				{
					"type": "special-hide-keyboard",
					"display-icon": "PREDEFINED:HIDE",
					"stretch-ratio": 2
				}
				]
			}
			]
		},
		{
			"name": "special-characters",
			"rows": [
			make_row(
				[],
				"1234567890",
				[
					{
						"type": "special",
						"output": "Backspace",
						"display-icon": "PREDEFINED:DELETE",
						"stretch-ratio": 1.5
					}
				]
			),
			make_row(
				[],
				"@#$%&-+=~()",
				[{
					"type": "special",
					"output": "Return",
					"display": "Enter",
					"stretch-ratio": 2
				}]
			),
			make_row(
				[],
				"*\"':;!?<>{}[]",
				[]
			),
			make_row(
				[{
					"type": "switch-layout",
					"layout-name": "standart-characters",
					"display": "ABC",
					"stretch-ratio": 1.5
				}],
				"",
				[
					{
						"type": "char",
						"output": "_",
						"display": "_"
					},
					{
						"type": "char",
						"output": "/",
						"display": "/"
					},
					{
						"type": "char",
						"output": "Space",
						"stretch-ratio": 5
					},
					{
						"type": "special",
						"output": "LeftArrow",
						"display-icon": "PREDEFINED:LEFT"
					},
					{
						"type": "special",
						"output": "RightArrow",
						"display-icon": "PREDEFINED:RIGHT"
					},
					{
						"type": "special-hide-keyboard",
						"display-icon": "PREDEFINED:HIDE",
						"stretch-ratio": 2
					}
				]
			)
			]
		}
		]
	}
