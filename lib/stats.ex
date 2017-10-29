defmodule Stats do
  def minimum([h | tail]), do: minimum(tail,h)
  def minimum([], acc), do: acc
  def minimum([h | tail], acc), do: minimum(tail, min(h, acc))


  def maximum([h | tail]), do: maximum(tail,h)
  def maximum([], acc), do: acc
  def maximum([h | tail], acc), do: maximum(tail,max(h, acc))

  def range([h | tail]), do: range(tail,h,h)
  def range([], acc_min, acc_max), do: {acc_min,acc_max}
  def range([h | tail], acc_min, acc_max), do: range(tail, min(h, acc_min), max(h,acc_max) )
end
