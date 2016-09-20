ExUnit.start(timeout: 2000) # 2 seconds

defmodule GCDTest do
  use ExUnit.Case, async: true

  test "gcd(10, 4)" do
    assert GCD.compute(10, 4) == 2
  end

  test "gcd(18, 35)" do
    assert GCD.compute(18, 35) == 1
  end

  test "gcd(28851538, 1183019)" do
    assert GCD.compute(28851538, 1183019) == 17657
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
  def compute(a, b) do
    _gcd(a, b)
  end

  defp _gcd(a, b, current_divisor \\ 1, gcd \\ 0)
  defp _gcd(a, b, current_divisor, gcd) when current_divisor >= (a + b), do: gcd
  defp _gcd(a, b, current_divisor, gcd) do
    if rem(a, current_divisor) == 0 && rem(b, current_divisor) == 0 do
      _gcd(a, b, current_divisor+1, current_divisor)
    else
      _gcd(a, b, current_divisor + 1, gcd)
    end
  end
end
