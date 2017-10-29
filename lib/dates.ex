defmodule Dates do
  @moduledoc """
    Etudes for Elixir:
      Étude 5-3: Using String.split
      Étude 6-2: Accumulating the Sum of a List
  """
  def date_parts(input_string) do
    case Regex.match?(~r/^\d{1,4}-\d{1,2}-\d{1,2}$/, input_string ) do
      true -> input_string
        |> String.split("-")
        |> Enum.map(&String.to_integer/1)
      false -> :error
    end
  end

  def is_leap_year(year) do
    cond do
      rem(year, 400) == 0 or (rem(year,4) == 0 and rem(year, 100) > 0) -> true
      true -> false
    end
  end

  def days_per_month(month, leap_year \\ false) do
    cond do
      month in [1, 3, 5, 7, 8, 10, 12] -> 31
      month in    [4, 6,    9, 11] -> 30
      month == 2 and leap_year -> 29
      month == 2 -> 28
      true -> 0
    end
  end

  def cumul_days_per_month(month, leap_year) do
    (for m <- 0..(month-1), do: days_per_month(m, leap_year))
    |> Enum.sum
  end

  def gregorian(year, month, day) do
    inspect(Dates.is_leap_year(year))
    cumul_days_per_month(month, is_leap_year(year)) + day
  end

  def gregorian(input_string) do
    [year, month, day] = date_parts(input_string)
    gregorian(year, month, day)
  end
end
