require 'set'
p (sets = File.read("input").split("\n").map{|x|x.split(",").map{|x|x.split("-").map(&:to_i)}.map{|l,r| (l..r).to_set}}).count{|l,r|l.subset? r or r.subset? l}
p sets.count {|l,r| (l & r).length > 0}
