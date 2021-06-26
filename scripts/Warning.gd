extends Sprite


var end = false;


func _on_Timer_timeout() -> void:
	if !end:
		queue_free()
