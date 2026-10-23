extends StaticBody2D

@export var dialogue: Array[String] = [
	"¡Hola, viajero!",
	"¡algun dia CANTARAN TU NOMBRE!.",
	"Cuídate en el camino.",
	"estas tierras son peligrosas"
]

@onready var area: Area2D = $InteractionArea
@onready var prompt: Label = $prompt_2
@onready var dialogue_label: Label = $DialogueLabel

var player_in_range: bool = false
var dialogue_index: int = 0

func _ready() -> void:
	prompt.hide()
	dialogue_label.hide()


func _unhandled_input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("interactuar"):
		interact()

func interact() -> void:
	if dialogue_index < dialogue.size():
		prompt.hide()
		dialogue_label.text = dialogue[dialogue_index]
		dialogue_label.show()
		dialogue_index += 1
	else:
		end_dialogue()

func end_dialogue() -> void:
	dialogue_index = 0
	dialogue_label.hide()
	if player_in_range:
		prompt.show()

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
				player_in_range = true
				prompt.show()
	


func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		prompt.hide()
		end_dialogue()
