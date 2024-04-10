class_name KeyboardLayout

extends Node

var data:Dictionary = {}


func generate_character_data(char:String) -> Dictionary:
	if char == "":
		return {}
	char = char.to_upper()

	data = {
		"type": "char",
		"output": char,
		"display": char.to_lower(),
	}
	# if uppercase != lowercase
	if char != char.to_lower():
		data["display-uppercase"] = char
	return data


func generate_characters_data(chars:String) -> Array:
	var keys = []
	for char in chars.split(""):
		var data = generate_character_data(char)
		if data != {}:
			keys.append(data)
	return keys


func set_special(keys):
	for key in keys:
		if !("type" in key):
			key["type"] = "special"


func make_row(left_special_keys: Array, chars: String, right_special_keys: Array):
	set_special(left_special_keys)
	set_special(right_special_keys)

	var keys = left_special_keys
	var data = generate_characters_data(chars)
	if data != []:
		keys.append_array(data)
	if right_special_keys != []:
		keys.append_array(right_special_keys)
	return {
		"keys": keys
	}
