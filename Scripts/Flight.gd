class_name Flight
extends Node

@export var speed : float = 10
@export var maxSpeed : float = 40

@onready var body : CharacterBody3D = get_parent()

func _physics_process(delta: float) -> void:
    var velocity : Vector3 = -body.global_basis.z * speed
    body.velocity = velocity
    body.move_and_slide()
    
func accelerate(amount : float) -> void:
    speed += amount
    speed = clampf(speed, 0, maxSpeed)
