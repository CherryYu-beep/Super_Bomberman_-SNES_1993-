extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal set_bomb_sign(pos);
# Called when the node enters the scene tree for the first time.


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player1_set_bomb_player(pos):
	emit_signal("set_bomb_sign", pos);
	print("NodePlayer pos - ", self.position);
