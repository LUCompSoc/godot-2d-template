extends Area2D
var speed = 600
var direction := 0

func _ready() -> void:
	add_to_group("bullets")
func _process(delta: float) -> void:
	position.x += speed * direction * delta
	
func move_to_initial_position(newPosition: Vector2):
	position = newPosition


func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("enemy")):
		body.get_node("HealthComponent").take_damage(5)
