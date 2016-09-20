ExUnit.start(timeout: 2000) # 2 seconds

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

  test "fib runs in under 2 seconds" do
    assert Benchmark.measure(fn -> Fibonacci.compute(45) end) < 2
  end

  test "last digit fib(331)" do
    assert Fibonacci.last_digit(331) == 9
  end

  test "last digit fib(327305)" do
    assert Fibonacci.last_digit(327305) == 5
  end

  # TODO: make fasterer? not sure how to do that
  #  test "last digit fib(10000000)" do
  #    assert Fibonacci.last_digit(10000000) == 5
  #  end
end

defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end

defmodule Fibonacci do
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
  def compute(n, current \\ 0, next \\ 1)
  def compute(0, current, _next), do: current
  def compute(n, current, next), do: compute(n-1, next, current + next)

	# Problem Description
	# Task:
	# 	Given an integer n, find the last digit of the nth Fibonacci number F(n)(that is,F(n) mod 10).
	# 
	# Input Format: 
	# 	The input consists of a single integer n.
	# 
	# Constraints:
	# 	0≤ n ≤10^7.
	# Output Format:
	# 	Output the last digit of F(n).
  def last_digit(n), do: rem compute(n), 10
end
