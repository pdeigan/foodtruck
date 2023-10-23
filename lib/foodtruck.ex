defmodule Foodtruck do
  @data_api "https://data.sfgov.org/resource/rqzj-sfat.csv"
  @filepath "./data/Mobile_Food_Facility_Permit.csv"

  @moduledoc """
  Documentation for `Foodtruck`.
  """

  @spec run() :: {:error, atom()} | :ok
  @doc """
  This is the CLI for retrieving data about the city's latest
  food trucks.

  ## Examples

      iex> Foodtruck.run()
      :okFo

  """
  def run do
    IO.puts("Welcome to Food Truck Central\n")
    IO.puts("Please enter one of the following in the prompt\n")
    IO.puts("  pushcarts - retrieves pushcarts in the city")
    IO.puts("  trucks - retrieves trucks in the city")
    IO.puts("  expired - retrieves food trucks with expired permits")
    IO.puts("  approved - retrieves food trucks with permits that have been approved")

    input =
      IO.gets("Which would you like today? Enter now: ")
      |> String.trim()

    with :ok <- Fetch.fetch_data(@data_api, @filepath),
         do: Parse.parse_data(input, @filepath)

    IO.gets("Would you like to continue? y/n: ")
    |> String.trim()
    |> case do
      "y" -> run()
      _ -> :ok
    end
  end
end
