extends Node2D

onready var element : Node = $Element;
onready var window : Node2D = $Root/Path2D/PathFollow2D/Window;
onready var bluescreen : TextureRect =  $Element/BlueScreen;
onready var root_window : Node2D = $Root

var warning : PackedScene = preload("res://scenes/Warning.tscn");
var broken_window : PackedScene = preload("res://scenes/BrokenWindow.tscn");

var screen_size : Vector2 = OS.get_screen_size();

var end = false;

func set_end():
	end = true;

func _ready() -> void:
	randomize()
	get_tree().get_root().set_transparent_background(true);
	OS.window_size = screen_size;
	bluescreen.rect_size = screen_size;

func _process(delta):
	OS.center_window();

func quit():
	get_tree().quit()

func set_window_center():
	window.position = OS.window_size /  2

func broke_window():
	var bw : Sprite = broken_window.instance();
	bw.z_index = 999;
	bw.position = Vector2(rand_range(200,screen_size.x-200),rand_range(200,screen_size.y-200));
	element.add_child(bw);

func a():
	var wr : Sprite = warning.instance();
	if end:
		wr.end = true;
	wr.z_index = -1;
	wr.position = Vector2(rand_range(200,screen_size.x-200),rand_range(200,screen_size.y-200));
	element.add_child(wr);

func show_window():
	root_window.position = screen_size/2;
	window.show();

func show_eye():
	window.get_node("EyeLeft").show()
	window.get_node("EyeRight").show()
