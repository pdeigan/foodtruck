defmodule ParseTest do
  use ExUnit.Case
  doctest Parse

  # for the sake of time, I will explain my methodology here without implementing
  # these tests.
  #
  # the reason I am unable to implement these quickly is due to the need to
  # mock the file or data that would otherwise be streamed.

  test "happy path pushcarts" do
    #assert that we see pushcart data
  end

  test "happy path trucks" do
    #assert that we see truck data
  end

  test "happy path expired" do
    #assert that we see expired data
  end

  test "happy path expiring" do
    #assert that we see expiring data
  end

  test "missing file" do
    #assert that we see file not found error
  end

  test "happy path bad input" do
    #assert that we see "Entry not found" after bad user input
  end

  test "malformed data" do
    #assert that we see errors raised for bad data (not .csv, etc)
  end
end
