defmodule Foodtruck.MixProject do
  use Mix.Project

  def project do
    [
      app: :foodtruck,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:csv, "~> 3.2"},
      {:httpoison, "~> 2.0"},
      {:mox, "~> 0.5.2", only: :test},
      {:tzdata, "~> 1.1"},
    ]
  end
end
