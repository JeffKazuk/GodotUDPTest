extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene('res://Sever.tscn')


func _on_Button2_pressed():
	get_tree().change_scene('res://Client.tscn')
