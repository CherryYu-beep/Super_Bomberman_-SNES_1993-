extends Node2D


func _ready():
	pass

var a = 1;

func _on_Player_set_bomb_sign(pos):
	var bomb = preload("res://Bomb.tscn").instance();
	bomb.position = pos;
	bomb.scale = Vector2(2, 2);
	self.add_child(bomb);
