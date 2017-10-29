defmodule Teeth do
  @moduledoc """
  Etudes for Elixir:
    Étude 6-3: Lists of Lists
  """
  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
    [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
    [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
    [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
    [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
    [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
    [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
    [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
    [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
    [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
    [3,2,3,2,3,2]]
  end

  def alert(list_teeth), do: alert(list_teeth, [], 1)
  def alert([], list_result, _index), do: list_result
  def alert([h | tail], list_result, index) do
    new_list_result = case Stats.maximum(h) >= 4 do
      true  -> list_result ++ [index]
      false -> list_result
    end
    alert(tail, new_list_result, index+1)
  end

end
