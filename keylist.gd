extends Node

var keyListLowercase = {
	"A":KEY_A,
	"B":KEY_B,
	"C":KEY_C,
	"D":KEY_D,
	"E":KEY_E,
	"F":KEY_F,
	"G":KEY_G,
	"H":KEY_H,
	"I":KEY_I,
	"J":KEY_J,
	"K":KEY_K,
	"L":KEY_L,
	"M":KEY_M,
	"N":KEY_N,
	"O":KEY_O,
	"P":KEY_P,
	"Q":KEY_Q,
	"R":KEY_R,
	"S":KEY_S,
	"T":KEY_T,
	"U":KEY_U,
	"V":KEY_V,
	"W":KEY_W,
	"X":KEY_X,
	"Y":KEY_Y,
	"Z":KEY_Z,
	"à":KEY_AGRAVE,
	"á":KEY_AACUTE,
	"â":KEY_ACIRCUMFLEX,
	"ã":KEY_ATILDE,
	"ä":KEY_ADIAERESIS,
	"å":KEY_ARING,
	"æ":KEY_AE,
	"ç":KEY_CCEDILLA,
	"è":KEY_EGRAVE,
	"é":KEY_EACUTE,
	"ê":KEY_ECIRCUMFLEX,
	"ë":KEY_EDIAERESIS,
	"ì":KEY_IGRAVE,
	"í":KEY_IACUTE,
	"î":KEY_ICIRCUMFLEX,
	"ð":KEY_ETH,
	"ñ":KEY_NTILDE,
	"ò":KEY_OGRAVE,
	"ó":KEY_OACUTE,
	"ô":KEY_OCIRCUMFLEX,
	"õ":KEY_OTILDE,
	"ö":KEY_ODIAERESIS,
	"ø":KEY_OOBLIQUE,
	"ù":KEY_UGRAVE,
	"ú":KEY_UACUTE,
	"û":KEY_UCIRCUMFLEX,
	"ü":KEY_UDIAERESIS,
	"ý":KEY_YACUTE,
	"ÿ":KEY_YDIAERESIS,
}

var keyListUnicode = {
	"Escape":KEY_ESCAPE,
	"Tab":KEY_TAB,
	"Shift-Tab":KEY_BACKTAB,
	"Backspace":KEY_BACKSPACE,
	"Return":KEY_ENTER,
	"Enter":KEY_KP_ENTER,
	"Insert":KEY_INSERT,
	"Delete":KEY_DELETE,
	"Pause":KEY_PAUSE,
	"Printscreen":KEY_PRINT,
	"SystemRequest":KEY_SYSREQ,
	"Clear":KEY_CLEAR,
	"Home":KEY_HOME,
	"End":KEY_END,
	"LeftArrow":KEY_LEFT,
	"UpArrow":KEY_UP,
	"RightArrow":KEY_RIGHT,
	"DownArrow":KEY_DOWN,
	"Pageup":KEY_PAGEUP,
	"Pagedown":KEY_PAGEDOWN,
	"Shift":KEY_SHIFT,
	"Control":KEY_CONTROL,
	"Meta":KEY_META,
	"Alt":KEY_ALT,
	"Capslock":KEY_CAPSLOCK,
	"Numlock":KEY_NUMLOCK,
	"Scrolllock":KEY_SCROLLLOCK,
	"F1":KEY_F1,
	"F2":KEY_F2,
	"F3":KEY_F3,
	"F4":KEY_F4,
	"F5":KEY_F5,
	"F6":KEY_F6,
	"F7":KEY_F7,
	"F8":KEY_F8,
	"F9":KEY_F9,
	"F10":KEY_F10,
	"F11":KEY_F11,
	"F12":KEY_F12,
	"F13":KEY_F13,
	"F14":KEY_F14,
	"F15":KEY_F15,
	"F16":KEY_F16,
	"MultiplyonNumpad":KEY_KP_MULTIPLY,
	"DivideonNumpad":KEY_KP_DIVIDE,
	"SubtractonNumpad":KEY_KP_SUBTRACT,
	"PeriodonNumpad":KEY_KP_PERIOD,
	"AddonNumpad":KEY_KP_ADD,
	"Number0onNumpad":KEY_KP_0,
	"Number1onNumpad":KEY_KP_1,
	"Number2onNumpad":KEY_KP_2,
	"Number3onNumpad":KEY_KP_3,
	"Number4onNumpad":KEY_KP_4,
	"Number5onNumpad":KEY_KP_5,
	"Number6onNumpad":KEY_KP_6,
	"Number7onNumpad":KEY_KP_7,
	"Number8onNumpad":KEY_KP_8,
	"Number9onNumpad":KEY_KP_9,
	"LeftSuper(Windows)":KEY_SUPER_L,
	"RightSuper(Windows)":KEY_SUPER_R,
	"Contextmenu":KEY_MENU,
	"LeftHyper":KEY_HYPER_L,
	"RightHyper":KEY_HYPER_R,
	"Help":KEY_HELP,
	"LeftDirection":KEY_DIRECTION_L,
	"RightDirection":KEY_DIRECTION_R,
	"Back":KEY_BACK,
	"Forward":KEY_FORWARD,
	"Stop":KEY_STOP,
	"Refresh":KEY_REFRESH,
	"Volumedown":KEY_VOLUMEDOWN,
	"Mutevolume":KEY_VOLUMEMUTE,
	"Volumeup":KEY_VOLUMEUP,
	"BassBoost":KEY_BASSBOOST,
	"BassUp":KEY_BASSUP,
	"BassDown":KEY_BASSDOWN,
	"TrebleUp":KEY_TREBLEUP,
	"TrebleDown":KEY_TREBLEDOWN,
	"Mediaplay":KEY_MEDIAPLAY,
	"Mediastop":KEY_MEDIASTOP,
	"Previoussong":KEY_MEDIAPREVIOUS,
	"Nextsong":KEY_MEDIANEXT,
	"Mediarecord":KEY_MEDIARECORD,
	"Homepage":KEY_HOMEPAGE,
	"Favorites":KEY_FAVORITES,
	"Search":KEY_SEARCH,
	"Standby":KEY_STANDBY,
	"OpenURL/LaunchBrowser":KEY_OPENURL,
	"LaunchMail":KEY_LAUNCHMAIL,
	"LaunchMedia":KEY_LAUNCHMEDIA,
	"LaunchShortcut0":KEY_LAUNCH0,
	"LaunchShortcut1":KEY_LAUNCH1,
	"LaunchShortcut2":KEY_LAUNCH2,
	"LaunchShortcut3":KEY_LAUNCH3,
	"LaunchShortcut4":KEY_LAUNCH4,
	"LaunchShortcut5":KEY_LAUNCH5,
	"LaunchShortcut6":KEY_LAUNCH6,
	"LaunchShortcut7":KEY_LAUNCH7,
	"LaunchShortcut8":KEY_LAUNCH8,
	"LaunchShortcut9":KEY_LAUNCH9,
	"LaunchShortcutA":KEY_LAUNCHA,
	"LaunchShortcutB":KEY_LAUNCHB,
	"LaunchShortcutC":KEY_LAUNCHC,
	"LaunchShortcutD":KEY_LAUNCHD,
	"LaunchShortcutE":KEY_LAUNCHE,
	"LaunchShortcutF":KEY_LAUNCHF,
	"Unknown":KEY_UNKNOWN,
	"Space":KEY_SPACE,
	"!":KEY_EXCLAM,
	"\"":KEY_QUOTEDBL,
	"#":KEY_NUMBERSIGN,
	"$":KEY_DOLLAR,
	"%":KEY_PERCENT,
	"&":KEY_AMPERSAND,
	"'":KEY_APOSTROPHE,
	"(":KEY_PARENLEFT,
	")":KEY_PARENRIGHT,
	"*":KEY_ASTERISK,
	"+":KEY_PLUS,
	",":KEY_COMMA,
	"-":KEY_MINUS,
	".":KEY_PERIOD,
	"/":KEY_SLASH,
	"0":KEY_0,
	"1":KEY_1,
	"2":KEY_2,
	"3":KEY_3,
	"4":KEY_4,
	"5":KEY_5,
	"6":KEY_6,
	"7":KEY_7,
	"8":KEY_8,
	"9":KEY_9,
	":":KEY_COLON,
	";":KEY_SEMICOLON,
	"<":KEY_LESS,
	"=":KEY_EQUAL,
	">":KEY_GREATER,
	"?":KEY_QUESTION,
	"@":KEY_AT,
	"A":KEY_A,
	"B":KEY_B,
	"C":KEY_C,
	"D":KEY_D,
	"E":KEY_E,
	"F":KEY_F,
	"G":KEY_G,
	"H":KEY_H,
	"I":KEY_I,
	"J":KEY_J,
	"K":KEY_K,
	"L":KEY_L,
	"M":KEY_M,
	"N":KEY_N,
	"O":KEY_O,
	"P":KEY_P,
	"Q":KEY_Q,
	"R":KEY_R,
	"S":KEY_S,
	"T":KEY_T,
	"U":KEY_U,
	"V":KEY_V,
	"W":KEY_W,
	"X":KEY_X,
	"Y":KEY_Y,
	"Z":KEY_Z,
	"[":KEY_BRACKETLEFT,
	"\\":KEY_BACKSLASH,
	"]":KEY_BRACKETRIGHT,
	"^":KEY_ASCIICIRCUM,
	"_":KEY_UNDERSCORE,
	"LeftQuote":KEY_QUOTELEFT,
	"{":KEY_BRACELEFT,
	"|":KEY_BAR,
	"}":KEY_BRACERIGHT,
	"~":KEY_ASCIITILDE,
	"NoBreakSpace":KEY_NOBREAKSPACE,
	"ExcalmDown":KEY_EXCLAMDOWN,
	"¢":KEY_CENT,
	"Sterling":KEY_STERLING,
	"Currency":KEY_CURRENCY,
	"Yen":KEY_YEN,
	"¦":KEY_BROKENBAR,
	"§":KEY_SECTION,
	"¨":KEY_DIAERESIS,
	"©":KEY_COPYRIGHT,
	"Feminine":KEY_ORDFEMININE,
	"«":KEY_GUILLEMOTLEFT,
	"»":KEY_NOTSIGN,
	"‐":KEY_HYPHEN,
	"®":KEY_REGISTERED,
	"Macron":KEY_MACRON,
	"°":KEY_DEGREE,
	"±":KEY_PLUSMINUS,
	"²":KEY_TWOSUPERIOR,
	"³":KEY_THREESUPERIOR,
	"´":KEY_ACUTE,
	"µ":KEY_MU,
	"Paragraph":KEY_PARAGRAPH,
	"·":KEY_PERIODCENTERED,
	"¬":KEY_CEDILLA,
	"¹":KEY_ONESUPERIOR,
	"♂":KEY_MASCULINE,
	"GuillemotRight":KEY_GUILLEMOTRIGHT,
	"¼":KEY_ONEQUARTER,
	"½":KEY_ONEHALF,
	"¾":KEY_THREEQUARTERS,
	"¿":KEY_QUESTIONDOWN,
	"à":KEY_AGRAVE,
	"á":KEY_AACUTE,
	"â":KEY_ACIRCUMFLEX,
	"ã":KEY_ATILDE,
	"ä":KEY_ADIAERESIS,
	"å":KEY_ARING,
	"æ":KEY_AE,
	"ç":KEY_CCEDILLA,
	"è":KEY_EGRAVE,
	"é":KEY_EACUTE,
	"ê":KEY_ECIRCUMFLEX,
	"ë":KEY_EDIAERESIS,
	"ì":KEY_IGRAVE,
	"í":KEY_IACUTE,
	"î":KEY_ICIRCUMFLEX,
	"Idiaeresis":KEY_IDIAERESIS,
	"ð":KEY_ETH,
	"ñ":KEY_NTILDE,
	"ò":KEY_OGRAVE,
	"ó":KEY_OACUTE,
	"ô":KEY_OCIRCUMFLEX,
	"õ":KEY_OTILDE,
	"ö":KEY_ODIAERESIS,
	"×":KEY_MULTIPLY,
	"ø":KEY_OOBLIQUE,
	"ù":KEY_UGRAVE,
	"ú":KEY_UACUTE,
	"û":KEY_UCIRCUMFLEX,
	"ü":KEY_UDIAERESIS,
	"ý":KEY_YACUTE,
	"þ":KEY_THORN,
	"ß":KEY_SSHARP,
	"÷":KEY_DIVISION,
	"ÿ":KEY_YDIAERESIS,
}

var keyListScancode = {
	"Escape":16777217,
	"Tab":16777218,
	"Shift-Tab":16777219,
	"Backspace":16777220,
	"Return":16777221,
	"Enter":16777222,
	"Insert":16777223,
	"Delete":16777224,
	"Pause":16777225,
	"Printscreen":16777226,
	"SystemRequest":16777227,
	"Clear":16777228,
	"Home":16777229,
	"End":16777230,
	"LeftArrow":16777231,
	"UpArrow":16777232,
	"RightArrow":16777233,
	"DownArrow":16777234,
	"Pageup":16777235,
	"Pagedown":16777236,
	"Shift":16777237,
	"Control":16777238,
	"Meta":16777239,
	"Alt":16777240,
	"Capslock":16777241,
	"Numlock":16777242,
	"Scrolllock":16777243,
	"F1":16777244,
	"F2":16777245,
	"F3":16777246,
	"F4":16777247,
	"F5":16777248,
	"F6":16777249,
	"F7":16777250,
	"F8":16777251,
	"F9":16777252,
	"F10":16777253,
	"F11":16777254,
	"F12":16777255,
	"F13":16777256,
	"F14":16777257,
	"F15":16777258,
	"F16":16777259,
	"MultiplyonNumpad":16777345,
	"DivideonNumpad":16777346,
	"SubtractonNumpad":16777347,
	"PeriodonNumpad":16777348,
	"AddonNumpad":16777349,
	"Number0onNumpad":16777350,
	"Number1onNumpad":16777351,
	"Number2onNumpad":16777352,
	"Number3onNumpad":16777353,
	"Number4onNumpad":16777354,
	"Number5onNumpad":16777355,
	"Number6onNumpad":16777356,
	"Number7onNumpad":16777357,
	"Number8onNumpad":16777358,
	"Number9onNumpad":16777359,
	"LeftSuper(Windows)":16777260,
	"RightSuper(Windows)":16777261,
	"Contextmenu":16777262,
	"LeftHyper":16777263,
	"RightHyper":16777264,
	"Help":16777265,
	"LeftDirection":16777266,
	"RightDirection":16777267,
	"Back":16777280,
	"Forward":16777281,
	"Stop":16777282,
	"Refresh":16777283,
	"Volumedown":16777284,
	"Mutevolume":16777285,
	"Volumeup":16777286,
	"BassBoost":16777287,
	"BassUp":16777288,
	"BassDown":16777289,
	"TrebleUp":16777290,
	"TrebleDown":16777291,
	"Mediaplay":16777292,
	"Mediastop":16777293,
	"Previoussong":16777294,
	"Nextsong":16777295,
	"Mediarecord":16777296,
	"Homepage":16777297,
	"Favorites":16777298,
	"Search":16777299,
	"Standby":16777300,
	"OpenURL/LaunchBrowser":16777301,
	"LaunchMail":16777302,
	"LaunchMedia":16777303,
	"LaunchShortcut0":16777304,
	"LaunchShortcut1":16777305,
	"LaunchShortcut2":16777306,
	"LaunchShortcut3":16777307,
	"LaunchShortcut4":16777308,
	"LaunchShortcut5":16777309,
	"LaunchShortcut6":16777310,
	"LaunchShortcut7":16777311,
	"LaunchShortcut8":16777312,
	"LaunchShortcut9":16777313,
	"LaunchShortcutA":16777314,
	"LaunchShortcutB":16777315,
	"LaunchShortcutC":16777316,
	"LaunchShortcutD":16777317,
	"LaunchShortcutE":16777318,
	"LaunchShortcutF":16777319,
	"Unknown":33554431,
	"Space":32,
	"!":33,
	"\"":34,
	"#":35,
	"$":36,
	"%":37,
	"&":38,
	"'":39,
	"(":40,
	")":41,
	"*":42,
	"+":43,
	",":44,
	"-":45,
	".":46,
	"/":47,
	"0":48,
	"1":49,
	"2":50,
	"3":51,
	"4":52,
	"5":53,
	"6":54,
	"7":55,
	"8":56,
	"9":57,
	":":58,
	";":59,
	"<":60,
	"=":61,
	">":62,
	"?":63,
	"@":64,
	"A":65,
	"B":66,
	"C":67,
	"D":68,
	"E":69,
	"F":70,
	"G":71,
	"H":72,
	"I":73,
	"J":74,
	"K":75,
	"L":76,
	"M":77,
	"N":78,
	"O":79,
	"P":80,
	"Q":81,
	"R":82,
	"S":83,
	"T":84,
	"U":85,
	"V":86,
	"W":87,
	"X":88,
	"Y":89,
	"Z":90,
	"[":91,
	"\\":92,
	"]":93,
	"^":94,
	"_":95,
	"LeftQuote":96,
	"{":123,
	"|":124,
	"}":125,
	"~":126,
	"NoBreakSpace":160,
	"ExcalmDown":161,
	"¢":162,
	"Sterling":163,
	"Currency":164,
	"Yen":165,
	"¦":166,
	"§":167,
	"¨":168,
	"©":169,
	"Feminine":170,
	"«":171,
	"»":172,
	"‐":173,
	"®":174,
	"Macron":175,
	"°":176,
	"±":177,
	"²":178,
	"³":179,
	"´":180,
	"µ":181,
	"Paragraph":182,
	"·":183,
	"¬":184,
	"¹":185,
	"♂":186,
	"GuillemotRight":187,
	"¼":188,
	"½":189,
	"¾":190,
	"¿":191,
	"à":192,
	"á":193,
	"â":194,
	"ã":195,
	"ä":196,
	"å":197,
	"æ":198,
	"ç":199,
	"è":200,
	"é":201,
	"ê":202,
	"ë":203,
	"ì":204,
	"í":205,
	"î":206,
	"Idiaeresis":207,
	"ð":208,
	"ñ":209,
	"ò":210,
	"ó":211,
	"ô":212,
	"õ":213,
	"ö":214,
	"×":215,
	"ø":216,
	"ù":217,
	"ú":218,
	"û":219,
	"ü":220,
	"ý":221,
	"þ":222,
	"ß":223,
	"÷":247,
	"ÿ":255,
}

func hasLowercase(name):
	return keyListLowercase.has(name)

func getScancodeFromString(name, debug=false):
	if keyListScancode.has(str(name)):
		if debug:
			print("OK:"+name)
		return keyListScancode.get(str(name))
	else:
		if debug:
			print("Key not found:"+ name)
		return KEY_UNKNOWN


func getUnicodeFromString(name, debug=false):
	if keyListUnicode.has(str(name)):
		if debug:
			print("OK:"+name)
		return keyListUnicode.get(str(name))
	else:
		if debug:
			print("Key not found:"+ name)
		return KEY_UNKNOWN

func _ready():
	pass # Replace with function body.