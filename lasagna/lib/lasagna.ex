defmodule Lasagna do

  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(time_so_far) do
    expected_minutes_in_oven() - time_so_far
  end

  def preparation_time_in_minutes(num_layers), do: 2 * num_layers

  def total_time_in_minutes(num_layers, time_so_far) do
    preparation_time_in_minutes(num_layers) + time_so_far
  end

  def alarm(), do: "Ding!"

end
