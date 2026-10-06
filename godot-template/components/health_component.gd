extends Node2D

class_name HealthComponent

@export var MAX_HEALTH:= 10.0
var health: float

func _ready() -> void:
	reset_hp()


func reset_hp():
	health = MAX_HEALTH


func take_damage(damage: float) -> void:
	health -= damage
	
	# runs when you "die"
	if health <= 0:
		if(get_parent().is_in_group("player")):
			get_tree().reload_current_scene()
		else:
			get_parent().queue_free() 


func heal(heal_amount: float) -> void:
	health += heal_amount
	
	if health > MAX_HEALTH:
		health = MAX_HEALTH
