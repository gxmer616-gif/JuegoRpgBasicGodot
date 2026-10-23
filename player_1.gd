extends CharacterBody2D

@export var speed: float = 200.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	velocity = direction * speed
	move_and_slide()

	if direction != Vector2.ZERO:
		anim.play("Walk")
		if direction.x != 0:
			anim.flip_h = direction.x < 0
	else:
		anim.play("Idle")
