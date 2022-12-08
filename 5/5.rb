crates,moves=File.read("input").split("\n\n").map{|x|x.split("\n")}
crates=crates.map(&:chars).transpose.filter{|x|x.last!=' '}.map{|x|x[..-2].filter{|x|x!=' '}}
crates2=crates.map(&:dup)
(moves=moves.map{|m|/move (\d+) from (\d+) to (\d+)/.match(m).captures.map(&:to_i)}).each {|c,src,dst|crates[dst-1]=crates[src-1].slice!(0,c).reverse+crates[dst-1];crates2[dst-1]=crates2[src-1].slice!(0,c)+crates2[dst-1]}
puts crates.map{|x|x.first}.join
puts crates2.map{|x|x.first}.join
