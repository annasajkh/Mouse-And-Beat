extends Node2D


onready var minimize : TextureRect = $TitleBar/minimaze;
onready var close : ColorRect = $TitleBar/close;
onready var cross : Sprite = $TitleBar/cross;

var window_is_not_on_battle_mode = true;
var is_on_minimize_button : bool = false;
var is_on_close_button : bool = false;
var black_cross : Texture = load("res://button/black_cross.png");
var white_cross : Texture = load("res://button/white_cross.png");

func swap_window_to_battle_mode() -> void:
	OS.window_size = Vector2(OS.get_screen_size().x,OS.get_screen_size().y);
	position = OS.window_size / 2;
	OS.center_window();
	window_is_not_on_battle_mode = false;

func _process(delta: float) -> void:
	OS.center_window();
	if Input.is_action_pressed("click") && is_on_close_button:
		close.modulate = Color("ed7777");
		cross.set_texture(white_cross);
	elif !Input.is_action_pressed("click") && is_on_close_button:
		close.modulate = Color("ec2d2d");
		cross.set_texture(white_cross);
	
	if Input.is_action_pressed("click") && is_on_minimize_button:
		minimize.modulate = Color("c3b9b9");
	elif !Input.is_action_pressed("click") && is_on_minimize_button:
		minimize.modulate = Color("e3dddd");

func _on_minimaze_mouse_entered() -> void:
	is_on_minimize_button = true;


func _on_minimaze_mouse_exited() -> void:
	minimize.modulate = Color("ffffff")
	is_on_minimize_button = false;


func _on_close_mouse_entered() -> void:
	is_on_close_button = true;


func _on_close_mouse_exited() -> void:
	close.modulate = Color("ffffff")
	cross.set_texture(black_cross);
	is_on_close_button = false;


func _on_Timer_timeout() -> void:
	$AnimationPlayer.play("h");
