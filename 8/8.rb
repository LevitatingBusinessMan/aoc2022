grid = File.read("input").split("\n").map{|x|x.split("").map{|y|y.to_i}}.transpose

visible_trees = 0

for tx in 1..grid.length-2
	for ty in 1..grid[0].length-2
		t = grid[tx][ty]

		visibles = []
		visibles << (0..tx-1).all? {|x| grid[x][ty] < t}
		visibles << ((tx+1)..grid.length-1).all? {|x| grid[x][ty] < t}
		visibles << (0..ty-1).all? {|y| grid[tx][y] < t}
		visibles << ((ty+1)..grid[0].length-1).all? {|y| grid[tx][y] < t}

		visible_trees += 1 if visibles.include? true
	end
end

p visible_trees + grid.length * 2 + grid[0].length * 2 - 4

max_score = 0

for tx in 1..grid.length-2
	for ty in 1..grid[0].length-2
		t = grid[tx][ty]

		left = 0
		for x in (0..tx-1).to_a.reverse	
			left += 1
			break if grid[x][ty] >= t	
		end

		right = 0
		for x in ((tx+1)..grid.length-1).to_a
			right += 1
			break if grid[x][ty] >= t	
		end

		up = 0
		for y in (0..ty-1).to_a.reverse
			up += 1
			break if grid[tx][y] >= t	
		end

		down = 0
		for y in ((ty+1)..grid[0].length-1).to_a
			down += 1
			break if grid[tx][y] >= t	
		end


		score = left * right * up * down
		max_score = score if max_score < score
	end
end

p max_score
