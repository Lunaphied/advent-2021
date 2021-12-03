{:ok, lines} = File.read("data/day1")
lines |> String.trim |> String.split("\n")
|> Stream.filter(&String.length(&1) > 0)
|> Enum.map(&String.to_integer/1)
|> Stream.chunk_every(2, 1)
|> Enum.filter(fn [a, b | _] -> b>a; [_] -> false;  end)
|> Enum.count
|> Integer.to_string
|> IO.puts
