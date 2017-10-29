defmodule Dijkstra do
  @moduledoc """
  Etudes for Elixir
  Etude 4.2 Recursion
  """

  @doc """
  get the Greatest common divisor (GCD) of two integers M and N
  by the Edsger W. Dijkstra method.
  If M and N are equal GCD is M
  if M > N return GCD of M-N, M
  if M < N return GCD of M, N-M
  """
  @spec gcd(integer, integer) :: integer
  def gcd(m,n) when is_integer(m) and is_integer(m) and m > 0 and n > 0 do
     pgcd(m,n)
  end
  defp pgcd(m,m), do: m
  defp pgcd(m,n) when m > n do
    # IO.puts("M=#{m},   N=#{n}")
    pgcd(m-n, n)
  end

  defp pgcd(m,n) when m < n do
    # IO.puts("M=#{m},   N=#{n}")
    pgcd(m,n-m)
  end
end
