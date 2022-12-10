class File
	attr_reader :size
	attr_reader :name
	def initialize name, size
		@name = name
		@size = size
	end
end

class Directory
	@name
	@parent
	@files = nil

	attr_writer :files
	attr_reader :files
	attr_reader :name
	attr_reader :parent

	def initialize name, parent
		@name = name
		@parent = parent
	end

	def size
		s = 0
		for file in @files
			s += file.size
		end
		s
	end

	# Recursively get all child directories
	def all_dirs
		dirs = @files.filter{|f| f.class == Directory}
		return [] if !dirs
		x = []
		for dir in dirs
			x += dir.all_dirs
		end
		dirs + x
	end
	
end

cwd = root = Directory.new "root", nil

lines = File.read("input").split("\n")
i = 0
while i < lines.length
	line = lines[i]
	#puts "processing: " + line
	
	if line.start_with? "$ cd"
		arg = /\$ cd ([\.\w\/]*)/.match(line).captures[0]
		if arg == "/"
			cwd = root
		elsif arg == ".."
			cwd = cwd.parent
		else
			abort "Can't cd from directory with files unknown" if cwd.files == nil
			cwd =  cwd.files.filter{|f| f.class == Directory}.find{|f| f.name == arg}
		end
	end
	if line.start_with? "$ ls"
		filelines = []
		while !lines[i+1].nil? && !lines[i+1].start_with?("$")
			filelines << lines[i += 1] 
		end
		cwd.files = filelines.map do |f|
			if f.start_with? "dir"
				Directory.new f[4..], cwd
			else
				size, name = /(\d*) (\w*)/.match(f).captures
				size = size.to_i
				File.new name, size
			end
		end
	end

	i += 1
end

# for dir in root.all_dirs
	# puts "#{dir.name}: #{dir.size}"
# end

dir_sizes = root.all_dirs.map{|d| d.size}
p dir_sizes.filter{|s| s <= 100000}.sum

space_to_be_made = root.size - 40000000

for s in dir_sizes.sort
	break if s > space_to_be_made
end
p s
