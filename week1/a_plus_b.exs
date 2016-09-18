input = IO.gets ""
[a_input, b_input] = String.split(input, " ")
{a, _} = Integer.parse(a_input)
{b, _} = Integer.parse(b_input)
IO.puts a + b
