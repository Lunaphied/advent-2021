{:ok, data} = File.read("data/day3")
filtered = data
|> String.split("\n")
|> Stream.filter(&String.length(&1) > 0)
entries = Enum.count(filtered)
gamma_rate = Stream.map(filtered, &String.to_integer(&1, 2))
|> Stream.map(&Integer.digits(&1, 2))
|> Stream.map(fn digits -> Enum.reverse(Stream.take(Stream.concat(digits, Stream.cycle([0])), 20)) end)
|> Enum.reduce(fn elem, acc ->
	Enum.zip([elem, acc])
	|> Enum.map(&Tuple.sum/1)
	end)

|> Enum.to_list
|> Enum.map(fn ones -> ones > entries/2 end)
|> Enum.map(fn true -> 1; false -> 0 end)
|> Integer.undigits(2)

IO.inspect(gamma_rate)
IO.inspect(gamma_rate*Integer.undigits(Enum.map(Integer.digits(gamma_rate, 2), fn 1 -> 0; 0 -> 1 end), 2))
