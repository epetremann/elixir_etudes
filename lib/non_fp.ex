defmodule NonFP do
  @moduledoc """
  Etudes doe Elixir:
    Étude 6-4: Random Numbers; Generating Lists of Lists
  """

  def generate_tooth(_base_depth, 0, acc_list), do: acc_list
  def generate_tooth(base_depth, left_items, acc_list) do
    new_acc_list = [:rand.uniform(2)-1 + base_depth | acc_list]
    inspect(new_acc_list)
    generate_tooth(base_depth, left_items-1, new_acc_list)
  end

  def generate_tooth(good_tooth_probability) do
    # :rand.seed(:erlang.now())
    base_depth = case :rand.uniform() < good_tooth_probability do
        true  -> 2
        false -> 3
      end
    IO.puts("generate_tooth/1: good_tooth_probability = #{good_tooth_probability}")
    IO.puts("generate_tooth/1: base_depth=#{base_depth}")
    generate_tooth(base_depth, 6, [])
  end

  #                                       12345678901234567890123456789012
  def generate_pockets(teeth_panorama \\ 'FTTTTTTTTTTTTTTFFTTTTTTTTTTTTTTF',
                       good_tooth_probability) do
    generate_pockets(teeth_panorama, good_tooth_probability,[])
  end

  def generate_pockets([],_good_tooth_probability,teeth_list) do
    teeth_list
  end
  def generate_pockets([h | tail], good_tooth_probability, teeth_list) do
    #IO.puts("generate_pockets/3: h=#{h}")
    inspect(tail)
    inspect(teeth_list)
    tooth = case [h] do
      'T' -> generate_tooth(good_tooth_probability)
      _   -> [0]
    end
      inspect(tooth)
      generate_pockets(tail, good_tooth_probability, [tooth | teeth_list])
  end

end
