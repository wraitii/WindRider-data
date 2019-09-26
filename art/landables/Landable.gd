extends Spatial

#signal body_entered
    
func _Body_Entered(body):
	#emit_signal("body_entered", body);
	get_parent().on_body_entered(body);
