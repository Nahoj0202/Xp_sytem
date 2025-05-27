extends Node2D

#your xp
var xp : int = 0
var attack : int = 0
var health : int = 0
var current_level : int = 1

#The dictionary that holds all of the level info
var level_info : Dictionary = {
	"1" : {"xp_required" : 0, "attack_bonus" : 3, "health_bonus" : 5},
	"2" : {"xp_required" : 250, "attack_bonus" : 4, "health_bonus" : 8},
	"3" : {"xp_required" : 350, "attack_bonus" : 6, "health_bonus" : 10},
	"4" : {"xp_required" : 500, "attack_bonus" : 3, "health_bonus" : 15},
	"5" : {"xp_required" : 1000, "attack_bonus" : 8, "health_bonus" : 20},
	"6" : {"xp_required" : 1500, "attack_bonus" : 9, "health_bonus" : 30},
	"7" : {"xp_required" : 2000, "attack_bonus" : 10, "health_bonus" : 50}
}

func _physics_process(_delta: float) -> void:
	$Control/xp.text = "Xp : " + str(xp)
	$Control/level.text  = "level : " + str(current_level)
	$Control/attack.text = "attack : " + str(attack)
	$Control/health.text = "health : " + str(health)
	#loops throuhg the dictionary
	for i in level_info:
		#checks if you have enough xp
		if level_info[str(i)]["xp_required"] <= xp:
			#checks if you have gotten this level before
			if current_level < int(i):
				#adds a level and attack and health but could be anything
				current_level = int(i)
				attack += level_info[str(1)]["attack_bonus"]
				health += level_info[str(1)]["health_bonus"]
				print(current_level)


func _on_button_pressed() -> void:
	xp += 50
