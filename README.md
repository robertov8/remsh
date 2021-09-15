# Remsh (Remote shells)

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `remsh` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:remsh, "~> 0.1.0"}
  ]
end
```

## Usage
```bash
iex --name server@localhost -S mix
# Optional
iex(server@localhost)1> REMSH.register()
iex(server@localhost)2> REMSH.inspect("Hello World")
```


```bash
iex --name client@localhost -S mix
iex(client@localhost)1> REMSH.connect("server")
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/remsh](https://hexdocs.pm/remsh).

