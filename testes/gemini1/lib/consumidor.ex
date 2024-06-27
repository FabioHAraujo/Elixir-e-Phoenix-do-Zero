defmodule Consumidor do
  def iniciar(id_consumidor) do
    spawn(fn -> consumir(id_consumidor) end)
  end

  defp consumir(id_consumidor) do
    {item, _lista} = Lista.remover()

    if item do
      IO.puts("Consumidor #{id_consumidor} removeu: #{item}")
    else
      IO.puts("Consumidor #{id_consumidor}: Lista vazia")
    end

    Process.sleep(4000)
    consumir(id_consumidor)
  end
end

Enum.each(1..2, &Consumidor.iniciar/1)
