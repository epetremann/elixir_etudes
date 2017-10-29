defmodule Powers do
  import Kernel, except: [raise: 2]
  @limit 1.0e-12
  @moduledoc """
  Etudes for Elixir
   - Etude 4.3 Non-Tail recursive Functions
   - Etude 4.4 Tail recursion with an accumulator
   - Etude 4.5 Recursion with a Helper function
  """

  @doc """
  raise (x,n) calculates the value of x to the power n.
  """
  def raise(x,n) when is_number(x) and is_integer(n), do: praise(x,n)

  def praise(_x,0), do: 1
  def praise(x,n) when  n > 0, do: praise(x,n,1)
  def praise(x,n) when x != 0, do: 1.0 / praise(x,-n)

  def praise(_x, 0, acc), do: acc
  def praise(x, n, acc), do: praise(x, n-1, x*acc)


  @doc """
  nth_root/2 finds the nth root of a  numner
  """
  def nth_root(x,n) when is_number(x) and x > 0 and is_integer(n) and n > 1
  do
    nth_root(x,n,x/2.0)
  end

  def nth_root(x,n,a) do
    IO.puts("#{x}, #{n}, #{a}")
    f = raise(a,n)-x
    f_prime = n * raise(a,n-1)
    next = a - (f / f_prime)
    change = abs(next - a)
    cond do
      change < @limit -> next
      true -> nth_root(x,n,next)
    end
  end
end
