extends Node2D

@onready var player:CharacterBody2D = get_node("../../Player")
@onready var node_2d: Node2D = $"../.."
@onready var bullet_path = "res://bullet.tscn"
@export var rotation_speed:float = 5.0

@onready var head:Sprite2D = $TurHead
@onready var raycast:RayCast2D = $RayCast2D

func _process(_delta: float) -> void:
	if player:
		var pos = player.global_position
		var angle = global_position.angle_to_point(pos)
		
		var current_angle = head.rotation
		head.rotation = lerp_angle(current_angle, angle, rotation_speed * _delta)
		
		raycast.target_position = Vector2(100, 0)
		raycast.force_raycast_update()
		if raycast.is_colliding() and raycast.get_collider() == player:
			fire()
			
func fire() -> void:
	var bullet=bullet_path.instantiate()
	if player:
		var angle = global_position.angle_to(player.global_position)
		bullet.dir = angle
		bullet.pos=$".".global_position 
		bullet.rota=global_rotation
		get_parent().add_child(bullet)
	
	
	
	
