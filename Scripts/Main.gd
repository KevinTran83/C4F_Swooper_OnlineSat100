class_name Main
extends Node

signal onVictory()
signal onDefeat()

func Victory() -> void : onVictory.emit()

func Defeat() -> void : onDefeat.emit()
