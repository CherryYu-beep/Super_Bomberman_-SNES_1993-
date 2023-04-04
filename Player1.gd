extends KinematicBody2D

export (int) var speed = 200

onready var _animated_sprite = $AnimatedSprite

var velocity = Vector2()


var move_flag;
var pressed;

signal set_bomb_player(pos);


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		_animated_sprite.play("right")
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		_animated_sprite.play("left")
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		_animated_sprite.play("down")
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		_animated_sprite.play("up")
	if Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left"):
		$AnimatedSprite.frame = 3;
		_animated_sprite.stop();
	if Input.is_action_just_pressed("set_bomb"):
		#var ref_a = get_tree().current_scene.get_node("Main");
		#ref_a.do
		emit_signal("set_bomb_player", self.position);
		print("pos player1 - ", self.position)	
	
	
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	
	get_input()
	velocity = move_and_slide(velocity)
