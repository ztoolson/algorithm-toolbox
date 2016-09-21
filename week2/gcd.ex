ExUnit.start(timeout: 2000) # 2 seconds

defmodule GCDTest do
  use ExUnit.Case, async: true
  test "euclidean gcd(10, 4)" do
    assert GCD.compute_euclidean(10, 4) == 2
  end

  test "euclidean gcd(10, 7)" do
    assert GCD.compute_euclidean(10, 7) == 1
  end

  test "euclidean gcd(18, 35)" do
    assert GCD.compute_euclidean(18, 35) == 1
  end

  test "euclidean gcd(357, 234)" do
    assert GCD.compute_euclidean(357, 234) == 3
  end

  test "euclidean gcd(28851538, 1183019" do
    assert GCD.compute_euclidean(28851538, 1183019) == 17657
  end

  test "euclidean gcd(3918848, 1653264)" do
    assert GCD.compute_euclidean(3918848, 1653264) == 61232
  end
end

# Problem Description
# Task:
#   Given two integers a and b, find their greatest common divisor.
# 
# Input Format.
#   The two integers a, b are given in the same line separated by space.
# 
# Constraints:
#   1≤ a, b ≤ 2·10^9.
# Output Format:
#   OutputGCD(a, b)
defmodule GCD do
  # TODO: read from standard input and output to standard output the result
  def compute_euclidean(a, b) do
    _euclid_gcd(a, b)
  end

  defp _euclid_gcd(a, 0), do: a
  defp _euclid_gcd(a, b), do: _euclid_gcd(b, rem(a, b))
end
