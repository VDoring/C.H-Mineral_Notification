
	proc(_locsimpleedit, @locarray, @yawpitchboolen,
	@return = array(
	'x': integer(@locarray[x]),
	'y': integer(@locarray[y]),
	'z': integer(@locarray[z]),
	'world': @locarray[world])
	if(@yawpitchboolen){
		if(array_index_exists(@locarray, 'yaw')){
			array_set(@return, 'yaw', @locarray[yaw])
		}
		if(array_index_exists(@locarray, 'pitch')){
			array_set(@return, 'pitch', @locarray[pitch])
		}
	}
	return(@return)
	)
	proc(_locsame, @loc1, @loc2, @yawpitchboolen){
		if(@loc1[x] == @loc2[x] && @loc1[y] == @loc2[y] && @loc1[z] == @loc2[z] && @loc1[world] == @loc2[world]){
			if(@yawpitchboolen){
				if(array_index_exists(@loc1, 'yaw') && array_index_exists(@loc2, 'yaw') &&  @loc1[yaw] == @loc2[yaw]){
					if(array_index_exists(@loc1, 'pitch') && array_index_exists(@loc2, 'pitch') && @loc1[pitch] == @loc2[pitch]){
						return(true)
					}else{
						return(false)
					}
					return(true)
				}else{
					return(false)
				}
			}
			return(true)
		}else{
			return(false)
		}
	}
	proc(_bedloc, @location, @data,
	switch(@data){
		case 9:
		@location[x] = @location[x] + 1
		case 8:
		@location[z] = @location[z] - 1
		case 10:
		@location[z] = @location[z] + 1
		case 11:
		@location[x] = @location[x] - 1
	}
	return(@location)
	)