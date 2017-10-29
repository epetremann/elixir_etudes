defmodule College do
  @moduledoc """
  Etudes for Elixir:
    Étude 7-1: Creating a HashDict from a File

  """



  def make_room_list do
    courses_list = "/home/edgard/code/elixir/etudes/data/courses.csv"
      |> File.read      #read the file
      |> elem(1)        # Extract second element of {:ok binary}
      |> String.split("\n")     # one element per line
      |> Enum.map(&(String.split(&1,",") #Separate line in elements
      |> List.to_tuple))                # convert to tuple
      |> List.delete_at(0)              # remove heading line
      |> List.delete_at(-1)             # remove last line


  end

end
