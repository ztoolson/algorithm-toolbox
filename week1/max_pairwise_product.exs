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
  end

defmodule Pairwise do
  def max_product do
    {number_of_inputs, _} = (IO.gets("") |> Integer.parse)
    input = IO.gets ""
    input_list = String.split(input, " ")

    # TODO: find the two largets numbers while iterating over the list
    int_list = Enum.map(input_list, fn number ->
      {a, _} = Integer.parse(number)
      a
    end)

    # for now just sort the list and multiply the two largest numbers
    sorted_list = Enum.sort(int_list)
    max_pairwise_product = Enum.at(sorted_list, number_of_inputs - 1) * Enum.at(sorted_list, number_of_inputs - 2)

    IO.puts max_pairwise_product
  end
end
