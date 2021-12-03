{:ok, lines} = File.read("data/day1")
lines |> String.trim |> String.split("\n")
|> Stream.filter(&String.length(&1) > 0)
|> Stream.map(&String.to_integer/1)
|> Stream.chunk_every(2, 1, :discard)
|> Enum.count(fn [h,t|_] -> t > h end)
|> Integer.to_string
|> IO.puts
