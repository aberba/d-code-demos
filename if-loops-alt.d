if (source) {
	if (source.pool) {
	    if (source.pool.repository) {
	      	if (source.pool.repository.directory) {
				if (source.pool.repository.directory.users) {
			  		// do something
				}
			}
		}
	}
}


// OR

if (source !is null &&
	source.pool !is null &&
	source.pool.repository !is null &&
	source.pool.repository.directory !is null &&
	source.pool.repository.directory.users !is null) {
	//...
}
