  ExUnit.start
  
  defmodule PairwiseTest do
    use ExUnit.Case, async: true
  
    import ExUnit.CaptureIO
  
    test "sorted input" do
      assert capture_io("3\n1 2 3", fn ->
        Pairwise.max_product
      end) == "6\n"
    end

    test "random input" do
      assert capture_io("10\n7 5 14 2 8 8 10 1 2 3", fn ->
        Pairwise.max_product
      end) == "140\n"
    end

    test "duplicate numbers" do
      assert capture_io("5\n4 6 2 6 1", fn ->
        Pairwise.max_product
      end) == "36\n"
    end

    test "large numbers" do
      assert capture_io("2\n100000 90000", fn ->
        Pairwise.max_product
      end) == "9000000000\n"
    end

    test "lots of zeros" do
      two_hundred_thousand_zeros = Enum.to_list(1..200_000) |> Enum.map(fn x -> x * 0 end)
      input = Enum.join(two_hundred_thousand_zeros, " ")

      assert capture_io("200000\n#{input}", fn ->
        Pairwise.max_product
      end) == "0\n"
    end

    test "sequence 1..200_000" do
      two_hundred_thousand_sequence = Enum.to_list(1..200_000)
      input = Enum.join(two_hundred_thousand_sequence, " ")

      assert capture_io("200000\n#{input}", fn ->
        Pairwise.max_product
      end) == "39999800000\n"
    end
  end


# Problem:
# 	Given a sequence of non-negative integers a0,…,an−1, find the
# 	maximum pairwise product, that is, the largest integer that can be
# 	obtained by multiplying two different elements from the sequence
# 
# Input Format:
# 	The first line of the input contains an integer n. The
# 	next line contains n non-negative integers a0,...,an−1 (separated by
# 	spaces).
# 
# Constraints:
# 	2 ≤ n ≤ 2 * 10^5
# 	0 ≤ a0,...,an−1 ≤ 10^5
# 
# Output format:
# 	Output a single number — the maximum pairwise product.
defmodule Pairwise do
  def max_product do
    {_number_of_inputs, _} = (IO.gets("") |> Integer.parse)
    input = IO.gets ""
    input_list = String.split(input, " ")

    [largest_num, second_largest_num] = Pairwise.get_largest_pair(input_list)

    max_pairwise_product = largest_num * second_largest_num

    IO.puts max_pairwise_product
  end

  def get_largest_pair(input_list) do
    dummy_max_result = [-1, -1]
    _get_largest_pair(input_list, dummy_max_result)
  end

  defp _get_largest_pair([], max_result), do: max_result
  defp _get_largest_pair([input_head | input_tail], result = [current_max, second_current_max]) do
    {x, _} = Integer.parse(input_head)
    updated_result = cond do
      x >= current_max ->
        [x, current_max]
      x >= second_current_max ->
        [current_max, x]
      true -> result
    end

    _get_largest_pair(input_tail, updated_result)
  end
end
