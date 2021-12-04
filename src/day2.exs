{:ok, data} = File.read("data/day2")
data
|> String.trim
|> String.split("\n")
|> Stream.filter(&String.length(&1) > 0)
|> Stream.map(&String.split(&1, " "))
|> Enum.reduce({0, 0}, fn [command, arg|_], {x, y} ->
	arg = String.to_integer(arg)
	case command do
		"forward" -> {x+arg, y}
		"down" -> {x, y+arg}
		"up" -> {x, y-arg}
		_ -> "Error unknown encountered"
	end
end)
|> then(fn {x, y} -> x*y end)
|> IO.inspect
