defmodule Fetch do
  @moduledoc """
  This module fetches the latest dataset before data is processed,
  and writes to a csv for parsing.
  """
  @spec fetch_data(String.t(), String.t()) :: {:error, atom()} | :ok
  def fetch_data(data_url, filepath) do
    HTTPoison.start()

    case HTTPoison.get!(data_url) do
      %HTTPoison.Response{status_code: 200, body: body} ->
        write(body, filepath)

      %HTTPoison.Response{status_code: 404} ->
        IO.puts("Latest food truck data not found, please try again later")

      %HTTPoison.Error{reason: reason} ->
        IO.inspect(reason)
    end

    :ok
  end

  defp write(body, filepath) do
    case File.write(filepath, body) do
      :ok ->
        :ok

      {:error, e} ->
        IO.puts("Error reading data: #{e}")
        {:error, e}
    end
  end
end
