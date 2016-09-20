ExUnit.start

defmodule FibonacciTest do
  use ExUnit.Case, async: true

  test "fib(0)" do
    assert Fibonacci.compute(0) == 0
  end

  test "fib(1)" do
    assert Fibonacci.compute(1) == 1
  end

  test "fib(3)" do
    assert Fibonacci.compute(3) == 2
  end

  test "fib(5)" do
    assert Fibonacci.compute(5) == 5
  end

  test "fib(10)" do
    assert Fibonacci.compute(10) == 55
  end

  test "fib(45)" do
    assert Fibonacci.compute(45) == 1134903170
  end

  test "runs in under 2 seconds" do
    assert Benchmark.measure(fn -> Fibonacci.compute(45) end) < 2
  end
end

defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

# Problem Description
# Task:
# 	Given an integer n, find the nth Fibonacci numberF(n).
# 
# Input Format:
# 	The input consists of a single integer n.
# 
# Constraints:
# 	0≤ n ≤ 45.
# 
# Output Format: Output F(n).
defmodule Fibonacci do
  def compute(0, current, _next), do: current
  def compute(n, current \\ 0, next \\ 1), do: compute(n-1, next, current + next)
end
