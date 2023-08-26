defmodule DbgRecompile do
  @moduledoc """
  Documentation for `DbgRecompile`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> DbgRecompile.hello()
      :world

  """
  def hello do
    IO.puts "running with dbg"
    :world |> dbg()
  end
end
