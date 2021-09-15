defmodule RemshTest do
  use ExUnit.Case
  doctest Remsh

  test "greets the world" do
    assert Remsh.hello() == :world
  end
end
