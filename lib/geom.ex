defmodule Geom do

  @moduledoc """
  From Etudes from Elixir:

    - Chapter 2: Functions and modules\n
    - Etude 2.1 : Writing a fUnctions\n
    - Etude 2.2 : Writing a function with default values\n
    - Etude 2.3 : Documenting a module\n
    - Etude 3-1 : Pattern matching
    - Etude 3-2 : Guards
    - Etude 3-3 : Underscaore
    - Etude 3-4 : Tuple as parameters


  """

  @doc """
  Calculate area of a rectangle
  with default values for width and length = 1

  """
  def area({shape, x, y}), do: area(shape, x, y)
  defp area(shape, x, y) when x >= 0 and y >= 0 do
    case shape do
      :rectangle -> x * y * 1.0
      :triangle -> x * y / 2
      :ellipse -> :math.pi() * x * y
      _ -> 0.0
    end
  end
  defp area(_area, _x, _y), do: 0.0
end
