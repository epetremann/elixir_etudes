defmodule AskArea do
  @moduledoc """
  Etudes for Elixir
   - Etude 5-1: Validating Input
   - Etude 5-2: Better validation with regular expressions
  """

  @types %{"r" => [shape: :rectangle, x: "width", y: "length"], \
   "t" => [shape: :triangle, x: "base", y: "height"], \
   "e" => [shape: :ellipse, x: "major radius" , y: "minor radius"] \
    }


  def get_type(prompt) do
    initial = IO.gets(prompt)
    |> String.trim_leading
    |> String.first
    |> String.downcase

    cond do
      @types |> Map.has_key?(initial) -> initial
      true -> get_type(prompt)
    end
  end

  def get_float(prompt) do
    case IO.gets(prompt) |> Float.parse do
      {n, _ } when n > 0 -> n
      _ -> get_float(prompt)
    end
  end

  def read_float(prompt) do
    input_string = IO.gets(prompt)
    case Regex.match?(~r/^\d+\.?\d*/, input_string) do
      true -> case Float.parse(input_string) do
        {n, _ } when n > 0 -> n
        _ -> get_float(prompt)
      end

      false -> read_float(prompt)
    end
  end


   def get_values() do
     initial = get_type("\n\tR) rectangle \n\tT) triangle \n\tE) ellipse \n")
     shape = @types[initial][:shape]
     x = get_float("Enter #{@types[initial][:x]} : ")
     y = get_float("Enter #{@types[initial][:y]} : ")
     {shape, x, y}
   end

   def calculate() do
     values = get_values()
     area = Geom.area(values)
     IO.inspect("Area of #{inspect(values)} = #{area}")
   end





end
