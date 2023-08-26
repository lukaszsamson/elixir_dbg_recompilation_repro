defmodule DbgRecompileTest do
  use ExUnit.Case
  doctest DbgRecompile

  test "greets the world" do
    assert DbgRecompile.hello() == :world
  end
end
