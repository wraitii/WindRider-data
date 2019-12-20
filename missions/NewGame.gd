extends "res://source/game/Mission.gd"

## This mission starts a game.

const EventPopup = preload('res://source/gui/EventPopup.tscn')

func start():
	Core.unload_scene()
	
	var sc = EventPopup.instance()
	sc.get_node('Title').text = "New Game"
	sc.get_node('Text').text = "Welcome to WindRider. I need to write this text."
	
	sc.get_node('OK').connect("pressed", self, "_continue")
	Core.load_scene(sc)

func _continue():
	Core.unload_scene()

	Core.gameState.player = Core.societyMgr.create_resource({
		"ID": "player_character",
		"short_name": "Player",
		"type": "character"
	})
	Core.gameState.player.credits = 10000;
	
	var playerShip = Core.outsideWorldSim.create_resource({'model': 'Starbridge'})
	Core.gameState.player.ship = playerShip
	
	Core.gameState.playerShip.teleport('Kerguelen', Vector3(-2000, 0, 0))
	
	var sc = EventPopup.instance()
	sc.get_node('Title').text = "Let's Go'"
	sc.get_node('Text').text = "Use key arrows to move around. Use Z to thrust. Use Space to fire."
	
	sc.get_node('OK').connect("pressed", self, "_clean", [sc])
	sc.anchor_bottom = 0.8
	sc.anchor_right = 0.8
	sc.anchor_left = 0.2
	sc.anchor_top = 0.2
	
	Core.gameState.currentScene.get_node('TopLayer').add_child(sc)

func _clean(scene):
	NodeHelpers.queue_delete(scene)
	_finish()
