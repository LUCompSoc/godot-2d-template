extends Node2D

const CLOSING_SPEED = 100
var is_closing: bool = false

@export var distanceToClose := 128

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if(is_closing and distanceToClose > 0):
		position.y += delta * CLOSING_SPEED	
		distanceToClose -= delta * CLOSING_SPEED
	
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("closing")
		is_closing = true
