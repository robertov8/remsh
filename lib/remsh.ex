defmodule REMSH do
  def connect(node) when is_bitstring(node) do
    [_, hostname] = get_node()

    register()

    server = "#{node}@#{hostname}"

    result =
      server
      |> String.to_atom()
      |> Node.connect()

    if result do
      "Successfully connected to: #{server}"
    else
      "Error connecting to: #{server}"
    end
  end

  def connect(_node), do: "Invalid params"

  def list(), do: [node()] ++ Node.list()

  def register() do
    [name, _] = get_node()

    result =
      name
      |> String.to_atom()
      |> :global.register_name(:erlang.group_leader())

    if result do
      "Successfully registered"
    else
      "Client already registered"
    end
  end

  def inspect(data \\ "") do
    if Enum.count(Node.list()) > 0 do
      Enum.each(Node.list(), &do_inspect(&1, data))
    else
      IO.puts("There are no clients connected!")
    end
  end

  defp do_inspect(node, data) do
    [name, _] = get_node(node)

    name
    |> String.to_atom()
    |> :global.whereis_name()
    |> output(data, node)
  end

  defp output(:undefined, _data, node), do: IO.puts("#{node} not registered!")

  defp output(device, data, _node) do
    date_now =
      NaiveDateTime.utc_now()
      |> NaiveDateTime.truncate(:second)
      |> NaiveDateTime.to_string()

    IO.inspect(device, data, label: "#{date_now} #{node()}", limit: :infinity)
  end

  defp get_node(name \\ node()) do
    name
    |> Atom.to_string()
    |> String.split("@")
  end
end
