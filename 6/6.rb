buffer = File.read("input")
p (3..buffer.length).find {|i| buffer[i-3..i].chars == buffer[i-3..i].chars.uniq} + 1
p (13..buffer.length).find {|i| buffer[i-13..i].chars == buffer[i-13..i].chars.uniq} + 1
