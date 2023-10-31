# Foodtruck

This project pulls data from the San Francisco food truck vendor database and does some simple breakdowns of the provided data. 

To run the application, pull the source code to your machine. From the foodtruck directory, run the following:
```elixir
iex -S mix
Foodtruck.run()
```

From here you will be prompted to run certain commands that are available.

# Code Overview

There are three main files to be reviewed:
1. lib/fetch.ex
    - This module fetches the latest dataset from the public API to be sure the user is receiving the latest information regarding food trucks
2. lib/foodtruck.ex
    - This module is the main module, where the application is run through
3. lib/parse.ex
    - This module parses the data the is fetched via fetch.ex, and returns the requested data to the user

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `foodtruck` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:foodtruck, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/foodtruck>.

