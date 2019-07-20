extends Position2D


const SCALE_RANGE = Vector2(0.5, 1.0)
const SCALE_RATE = 2.6


func _ready():
	$Arrow.scale = Vector2(SCALE_RANGE.x, SCALE_RANGE.x)


func _process(delta):
	var input_direction = utils.get_input_direction()
	if input_direction == Vector2():
		return
	
	rotation = input_direction.angle()


func _on_Move_speed_changed(_speed, max_speed):
	var start_scale = $Arrow.scale.x
	var final_scale = lerp(SCALE_RANGE.x, SCALE_RANGE.y, _speed/float(max_speed))
	
	var initial_val = Vector2(start_scale, start_scale)
	var final_val = Vector2(final_scale, final_scale)
	var duration = abs(final_scale - start_scale) / SCALE_RATE
	
	if duration > 0:
		$Tween.remove_all()
		$Tween.interpolate_property($Arrow, "scale", initial_val, final_val, duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()