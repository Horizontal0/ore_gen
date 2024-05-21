extends TileMap

var current_pos = Vector2i(0,0)

const default_layer = 0

const cell_list ={
	"up_left":Vector2i(1,1),
	"up":Vector2i(2,1),
	"up_right":Vector2i(3,1),
	"left_right":Vector2i(4,1),
	"left_down-rightc":Vector2i(5,1),
	"right_down-leftc":Vector2i(6,1),
	"up_down-rightc":Vector2i(7,1),
	"down_up-leftc":Vector2i(8,1),
	"left":Vector2i(1,2),
	"blank":Vector2i(2,2),
	"right":Vector2i(3,2),
	"up_down_left_right":Vector2i(4,2),
	"left_up-rightc":Vector2i(5,2),
	"right_up-leftc":Vector2i(6,2),
	"up_down-leftc":Vector2i(7,2),
	"down_up-rightc":Vector2i(8,2),
	"down_left":Vector2i(1,3),
	"down":Vector2i(2,3),
	"down_right":Vector2i(3,3),
	"up_down":Vector2i(4,3),
	"left_up-rightc_down-rightc":Vector2i(5,3),
	"right_up-leftc_down-leftc":Vector2i(6,3),
	"up_down-leftc_down-rightc":Vector2i(7,3),
	"down_up-leftc_uprightc":Vector2i(8,3),
	"up-rightc_down-leftc_down-rightc":Vector2i(1,4),
	"up-leftc_down-leftc_down-rightc":Vector2i(2,4),
	"up-leftc_up-rightc_down-rightc":Vector2i(3,4),
	"up-rightc_up-rightc_down-leftc":Vector2i(4,4),
	"down-leftc_down-rightc":Vector2i(5,4),
	"up-rightc_down-rightc":Vector2i(6,4),
	"down-leftc_up-rightc":Vector2i(7,4),
	"up-leftc_down-leftc":Vector2i(8,4),
	"up_leftc_down-leftc_down-rightc":Vector2i(1,5),
	"up_leftc_up-rightc_down-leftc_down-rightc":Vector2i(2,5),
	"down-leftc":Vector2i(3,5),
	"up_leftc_up-rightc":Vector2i(4,5),
	"up-rightc":Vector2i(5,5),
	"up_leftc":Vector2i(6,5),
	"down-rightc":Vector2i(2,5),
	"up_leftc_down-rightc":Vector2i(2,5),
	"up_left_right":Vector2i(1,6),
	"up_down_left":Vector2i(2,6),
	"up_left_down-rightc":Vector2i(3,6),
	"up_right_down-leftc":Vector2i(4,6),
	"down_left_right":Vector2i(1,7),
	"up_down_right":Vector2i(2,7),
	"down_left_up-rightc":Vector2i(3,7),
	"down_right_up-leftc":Vector2i(1,7),
}

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		generate(current_pos)

func _ready():
	#generate(current_pos)
	pass

func generate(current_pos):
	clear()
	set_cell(default_layer,current_pos,1,cell_list["blank"])
	var to_be_gen = []
	var generated = []
	var rng = 10
	var rng_minus = 1
	to_be_gen.append(current_pos)
	while not to_be_gen.is_empty():
		var tile = to_be_gen[0]
		for pos in to_be_gen:
			if randf_range(rng_minus,rng) < rng-rng_minus:
				if randf_range(rng_minus,rng) < rng-rng_minus:
					generated.append(pos)
					if not generated.has(Vector2i(pos.x,pos.y-1)):
						set_cell(default_layer,Vector2i(pos.x,pos.y-1),1,cell_list["blank"])
						to_be_gen.append(Vector2i(pos.x,pos.y-1))
						to_be_gen.erase(pos)
				else:
					to_be_gen.erase(Vector2i(pos.x,pos.y-1))
				if randf_range(rng_minus,rng) < rng-rng_minus:
					generated.append(pos)
					if not generated.has(Vector2i(pos.x,pos.y+1)):
						set_cell(default_layer,Vector2i(pos.x,pos.y+1),1,cell_list["blank"])
						to_be_gen.append(Vector2i(pos.x,pos.y+1))
						to_be_gen.erase(pos)
				else:
					to_be_gen.erase(Vector2i(pos.x,pos.y+1))
				if randf_range(rng_minus,rng) < rng-rng_minus:
					generated.append(pos)
					if not generated.has(Vector2i(pos.x-1,pos.y)):
						set_cell(default_layer,Vector2i(pos.x-1,pos.y),1,cell_list["blank"])
						to_be_gen.append(Vector2i(pos.x-1,pos.y))
						to_be_gen.erase(pos)
				else:
					to_be_gen.erase(Vector2i(pos.x-1,pos.y))
				if randf_range(rng_minus,rng) < rng-rng_minus:
					generated.append(pos)
					if not generated.has(Vector2i(pos.x+1,pos.y)):
						set_cell(default_layer,Vector2i(pos.x+1,pos.y),1,cell_list["blank"])
						to_be_gen.append(Vector2i(pos.x+1,pos.y))
						to_be_gen.erase(pos)
						print(to_be_gen)
				else:
					to_be_gen.erase(Vector2i(pos.x+1,pos.y))
				rng += 1
			print(rng)
			print(rng_minus)
			to_be_gen.erase(pos)
		to_be_gen.erase(tile)
			


func is_up(current_pos):
	return get_cell_source_id(default_layer, current_pos.x,current_pos.y+1) == 1

func is_down(current_pos):
	return get_cell_source_id(default_layer, current_pos.x,current_pos.y-1) == 1
	
func is_left(current_pos):
	return get_cell_source_id(default_layer, current_pos.x-1,current_pos.y) == 1

func is_right(current_pos):
	return get_cell_source_id(default_layer, current_pos.x+1,current_pos.y) == 1
