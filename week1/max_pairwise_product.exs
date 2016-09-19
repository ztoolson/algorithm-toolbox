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

    test "duplicate largest numbers" do
      assert capture_io("5\n4 6 2 6 1", fn ->
        Pairwise.max_product
      end) == "36\n"
    end
    
    # TODO stress test with 10^5 numbers
  end

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
        temp_result = List.replace_at(result, 1, Enum.at(result, 0))
        List.replace_at(temp_result, 0, x)
      x >= second_current_max ->
        List.replace_at(result, 1, x)
      true -> result
    end

    _get_largest_pair(input_tail, updated_result)
  end
end
