defmodule Gemini1Test do
  use ExUnit.Case
  doctest Gemini1

  test "greets the world" do
    assert Gemini1.hello() == :world
  end
end
