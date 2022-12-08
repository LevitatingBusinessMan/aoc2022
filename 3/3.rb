p (sacks=File.read("input").split).map{|x|l=x.length/2;[x[..l],x[l..]]}.map{|sack|sack[0].chars.find{|c|sack[1].include? c}}.map{|c|c.ord>90?(c.ord-96):(c.ord-38)}.sum
p sacks.each_slice(3).map{|triplet| t=triplet.map(&:chars);(t[0]&t[1]&t[2])[0]}.map{|c|c.ord>90?(c.ord-96):(c.ord-38)}.sum
