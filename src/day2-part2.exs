{:ok, data} = File.read("data/day2")
data
|> String.trim
|> String.split("\n")
|> Stream.filter(&String.length(&1) > 0)
|> Stream.map(&String.split(&1, " "))
|> Enum.reduce({0, 0, 0}, fn [command, arg|_], {x, y, aim} ->
	arg = String.to_integer(arg)
	case command do
		"forward" -> {x+arg, y+aim*arg, aim}
		"down" -> {x, y+arg, aim+arg}
		"up" -> {x, y-arg, aim-arg}
		_ -> "Error unknown encountered"
	end
end)
|> then(fn {x, y, _} -> x*y end)
|> IO.inspect
