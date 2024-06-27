defmodule Produtor do
  def iniciar(id_produtor) do
    spawn(fn -> produzir(id_produtor) end)
  end

  defp produzir(id_produtor) do
    item = "Item do Produtor #{id_produtor}"
    Lista.adicionar(item)
    Process.sleep(2000)
    produzir(id_produtor)
  end
end

Enum.each(1..2, &Produtor.iniciar/1)
