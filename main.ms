
	if(import('foundores')){
		export('foundores', array())
	}
	bind(block_break, null, null, @e,
	@ores = array(14, 56, 129)
	@v = import('foundores')
	if(array_contains(@ores, @e[block][type])){
		@oreqty = 0; @locs = array(); @loc = array('x': @e[block][X], 'y': @e[block][Y], 'z': @e[block][Z], 'world': @e[block][world]);
		for(@int = 0, lt(@int, array_size(array_keys(@v))), @int++){
			if(_locsame(@v[@int], @loc)){
				exit()
			}
		}
		for(@x = -2, @x < 3, @x++){
			for(@y = -2, @y < 3, @y++){
				for(@z = -2, @z < 3, @z++){
					@searchloc = array('x': integer(@loc[x] + @x), 'y': integer(@loc[y] + @y), 'z': integer(@loc[z] + @z), 'world': @loc[world])
					if(split(':', get_block_at(@searchloc))[0] == @e[block][type]){
						@oreqty = @oreqty + 1
						array_push(@locs, @searchloc)
					}
				}
			}
		}
		export('foundores', @locs)
		@orename = data_name(@e[block][type])
		switch(@orename){
			case 'Diamond Ore':
			@orename = '§b다이아몬드'
			case 'Emerald Ore':
			@orename = '§a에메랄드'
			case 'Gold Ore':
			@orename = '§e금'
		}
		broadcast(' §b[foundores]§7'@e[player].'님이'@orename.'§7를§b'@oreqty.'§7개 찾으셨습니다.')
	}
	)
	bind(block_place, null, null, @e,
	@ores = array(14, 56, 129)
	@v = import('foundores')
	if(array_contains(@ores, @e[type])){
		@loc = array('x': @e[location][x], 'y': @e[location][y], 'z': @e[location][z], 'world': @e[location][world]);
		for(@int = 0, lt(@int, array_size(array_keys(@v))), @int++){
			if(_locsame(@v[@int], @loc)){
				exit()
			}
		}
		array_push(@v, @loc)
		export('foundores', @v)
	}
	)