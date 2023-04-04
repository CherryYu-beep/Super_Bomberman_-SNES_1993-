extends KinematicBody2D

export (int) var speed = 200

onready var _animated_sprite = $AnimatedSprite

var velocity = Vector2()


var move_flag;
var pressed;
var facepos = 0; # 0 - up, 1 - down, 2 - right, 3 - left;

signal set_bomb_player(pos);

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		_animated_sprite.play("right")
		facepos = 2;
		$RayCast2D.set_cast_to(Vector2(16, 0));
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		_animated_sprite.play("left")
		facepos = 3;
		$RayCast2D.set_cast_to(Vector2(-16, 0));
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		_animated_sprite.play("down")
		facepos = 1;
		$RayCast2D.set_cast_to(Vector2(0, 16));
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1;
		_animated_sprite.play("up");
		facepos = 0;
		$RayCast2D.set_cast_to(Vector2(0, -16));
	if Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		$AnimatedSprite.frame = 3;
		_animated_sprite.stop();
	if Input.is_action_just_pressed("set_bomb") and not $RayCast2D.is_colliding():
		#var ref_a = get_tree().current_scene.get_node("Main");
		#ref_a.do
		emit_signal("set_bomb_player", self.position + $RayCast2D.get_cast_to() * 2);
		print($RayCast2D.get_cast_to());
		print("pos player1 - ", self.position);
		print("facepos - ", facepos);
	
	
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	
	get_input()
	velocity = move_and_slide(velocity)
