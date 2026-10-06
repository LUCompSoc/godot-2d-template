extends CharacterBody2D


@export var SPEED: float = 150.0

var is_thinking = false
var has_started = false

var direction: Vector2 = Vector2.ZERO
var directions: Array = [
	Vector2.UP,
	Vector2.DOWN,
	Vector2.RIGHT,
	Vector2.LEFT
]


func _ready() -> void:
	add_to_group("enemy")
	is_thinking = false


func _physics_process(delta: float) -> void:
	if !has_started:
		return
	if is_thinking:
		return	
	var collision = move_and_collide(velocity)
	
	if collision:
		_reselect_direction()
	
	velocity = direction * SPEED * delta


func _reselect_direction():
	direction = directions.pick_random()
	
	is_thinking = true
	velocity = Vector2.ZERO
	
	await get_tree().create_timer(0.2).timeout
	is_thinking = false
