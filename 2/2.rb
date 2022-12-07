opts = ["A","B","C","X","Y","Z"]
p (arr=File.read("input").split.each_slice(2).to_a).map{|m|case (opts.index(m[1]) - opts.index(m[0])) % 3 when 0 then 3 when 1 then 6 else 0 end + opts.index(m[1]) - 2}.sum
p arr.map{|m|(i = opts.index(m[0])) + case m[1] when "X" then i == 0 ? 3 : 0 when "Y" then 4 when "Z" then i == 2 ? 5 : 8 end}.sum
