ExUnit.start(timeout: 2000) # 2 seconds

defmodule LeastCommonMultipleTest do
  use ExUnit.Case, async: true

  test "lcm(6, 8)" do
    assert LeastCommonMultiple.compute(6, 8) == 24
  end

  test "lcm(28851538, 1183019)" do
    assert LeastCommonMultiple.compute(28851538, 1183019) == 1933053046
  end
end

# Problem Description
# Task:
#   Given two integers a and b, find their least common multiple.
# Input Format:
#   The two integers a and b are given in the same line separated by space.
# Constraints:
#   1 ≤ a, b ≤ 2*10^9.
# Output Format:
#   Output the least common multiple of a and b.
defmodule LeastCommonMultiple do
  def compute(a, b) do
    # make sure a is the largest argument
    if a >= b do
      _lcm(a, b, a*2)
    else
      _lcm(b, a, b*2)
    end
  end

  defp _lcm(a, b, current_multiple) do
    if rem(current_multiple, a) == 0 && rem(current_multiple, b) == 0 do
      current_multiple
    else
      _lcm(a, b, current_multiple + a)
    end
  end
end
