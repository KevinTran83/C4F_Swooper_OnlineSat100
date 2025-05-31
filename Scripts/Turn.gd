extends Node

@onready var body : CharacterBody3D = get_parent()
@onready var flight : Flight = get_node("../Flight")

@export var mesh : MeshInstance3D

@export var damp : float = 10

var speed : float

func showMouse() -> void : Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
func hideMouse() -> void : Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _ready() -> void:
    hideMouse()
    
    var main : Main = get_tree().get_root().get_node("Main")
    main.onDefeat .connect(showMouse)
    main.onVictory.connect(showMouse)
    
    speed = 0
    
func _process(delta : float) -> void:
    var mouseX = Input.get_last_mouse_velocity().x
    var mouseY = Input.get_last_mouse_velocity().y
    
    # Accelerate turn speed
    speed += mouseX/damp * delta
    speed = clampf(speed, -50, 50)
    
    speed = lerpf(speed, 0, 1 * delta) # Reduce turn speed
    
    body.rotate_y( -deg_to_rad(speed) * delta )
    body.rotate_object_local(Vector3.RIGHT, -deg_to_rad(mouseY/damp) * delta)
    
    # Accelerate flight speed based on pitch (x rotation)
    var pitch : float = rad_to_deg(body.get_rotation().x)
    if pitch > 0 : flight.accelerate(pitch/2 * delta)
    else         : flight.accelerate(pitch/5 * delta)
    
    if mesh : mesh.rotation.z = -deg_to_rad(speed) # TODO: Don't change the
                                                   #       variable directly.
