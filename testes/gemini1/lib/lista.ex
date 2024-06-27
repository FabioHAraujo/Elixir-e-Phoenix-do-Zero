defmodule Lista do
  def start_link(_) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def adicionar(item) do
    Agent.update(__MODULE__, fn lista -> [item | lista] end)
    IO.inspect(Agent.get(__MODULE__, & &1), label: "Lista após adição:")
  end

  def remover do
    Agent.get_and_update(__MODULE__, fn
      [] ->
        {nil, []}

      [item | resto] ->
        {item, resto}
    end)
  end
end
