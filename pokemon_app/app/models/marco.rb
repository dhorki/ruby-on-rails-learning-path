picture = ["abc", "efg"]

linea = ""

(1..picture[0].size + 2).each do linea = "*#{linea}" end

result = []
result.push(linea)

    
picture.each do |line|
    result.push("*#{line}*")
end

result.push(linea)

p result