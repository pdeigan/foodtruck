defmodule Parse do
  @moduledoc """
  This module streams data from a CSV file and returns the requested
  subset of data.
  """
  @spec parse_data(String.t(), String.t()) :: {:error, atom()} | :ok
  def parse_data(input, filepath) do
    data =
      filepath
      |> File.stream!()
      |> CSV.decode!(separator: ?,, headers: true)
      |> sanitize_data()

    case input do
      "pushcarts" ->
        get_push_carts(data)

      "trucks" ->
        get_trucks(data)

      "expired" ->
        get_expired(data)

      "expiring" ->
        get_expiring(data)

      _ ->
        IO.puts("Entry not found\n")
    end
  end

  defp get_push_carts(data) do
    IO.puts("~~~~~List of Push Cart Vendors~~~~~\n")

    data
    |> Enum.filter(fn x -> Map.get(x, :facilitytype) == "Push Cart" end)
    |> Enum.sort_by(& &1.applicant)
    |> Enum.each(fn x -> IO.puts(Map.get(x, :applicant) <> ", " <> Map.get(x, :address)) end)

    IO.puts("\n\n")
  end

  defp get_trucks(data) do
    IO.puts("~~~~~List of Truck Vendors~~~~~\n")

    data
    |> Enum.filter(fn x -> Map.get(x, :facilitytype) == "Truck" end)
    |> Enum.sort_by(& &1.applicant)
    |> Enum.each(fn x -> IO.puts(Map.get(x, :applicant) <> ", " <> Map.get(x, :address)) end)

    IO.puts("\n\n")
  end

  defp get_expired(data) do
    IO.puts("~~~~~List of Vendors with Expired Permits~~~~~\n")

    data
    |> Enum.filter(fn x -> Map.get(x, :status) == "EXPIRED" end)
    |> Enum.sort_by(& &1.applicant)
    |> Enum.each(fn x -> IO.puts(Map.get(x, :applicant) <> ", " <> Map.get(x, :address)) end)

    IO.puts("\n\n")
  end

  defp get_expiring(data) do
    IO.puts("~~~~~List of Vendors with Expiring Permits~~~~~\n")

    data
    |> Enum.filter(fn x -> Map.get(x, :status) == "APPROVED" end)
    |> Enum.sort_by(& &1.applicant)
    |> Enum.each(fn x -> IO.puts(Map.get(x, :applicant) <> ", " <> Map.get(x, :address)) end)

    IO.puts("\n\n")
  end

  defp sanitize_data(data) do
    data
    |> Enum.map(fn x -> Map.new(x, fn {k, v} -> {String.to_atom(k), v} end) end)
  end
end
