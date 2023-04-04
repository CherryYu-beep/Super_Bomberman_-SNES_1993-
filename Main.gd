extends Node2D


func _ready():
	pass


func _on_Player1_set_bomb_player(pos):
	var bomb = preload("res://BombF1.tscn").instance();
	bomb.scale = Vector2(2, 2);
	bomb.position = pos - Vector2(fmod(pos.x,32) - 16, fmod(pos.y,32) ) ;
	
	print(bomb.position)
	self.add_child(bomb);
	self.move_child(bomb, 1);
	yield(get_tree().create_timer(3), "timeout");
	
	self.remove_child(bomb);
