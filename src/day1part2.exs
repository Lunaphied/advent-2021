{:ok, lines} = File.read("data/day1")
lines |> String.trim |> String.split("\n")
|> Stream.filter(&String.length(&1) > 0)
|> Stream.map(&String.to_integer/1)
|> Stream.chunk_every(3, 1)
|> Stream.map(&Enum.sum/1)
|> Stream.chunk_every(2, 1, :discard)
|> Enum.count(fn [a,b|_] -> a<b end)
|> Integer.to_string
|> IO.puts
