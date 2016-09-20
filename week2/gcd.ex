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

defmodule GCD do
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
