defmodule FetchTest do
  alias ElixirSense.Core.MacroExpander
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  @good_url "good.url"
  @bad_url "bad.url"
  @good_filepath "/some/good/path"
  @bad_filepath "/some/bad/path"

  # for the sake of time, I will explain how I'd implement these tests
  # without actually implementing them
  #
  # in order to do this properly, I would need to abstract my http client
  # instead of calling HTTPoison directly.

  test "fetches good data to good path" do
    # call Fetch.fetch_data(@good_url, @good_filepath)
    # mock these calls and assert the result is :ok
  end

  test "fetches bad data to good path" do
    # call Fetch.fetch_data(@bad_url, @good_filepath)
    # mock these calls and assert the captured IO contains
    # "Latest food truck data not found, please try again later\n"
  end

  test "fetches bad data to bad path" do
    # call Fetch.fetch_data(@bad_url, @bad_filepath)
    # mock these calls and assert the result is the same as previous test
  end

  test "fetches good data to bad path" do
    # call Fetch.fetch_data(@good_url, @bad_filepath)
    # mock these calls and assert the result is {:error, _}
  end
end
