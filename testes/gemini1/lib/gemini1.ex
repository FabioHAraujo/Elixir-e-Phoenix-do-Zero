defmodule Gemini1 do
  def main(_) do
    Lista.start_link(nil)
    Enum.each(1..2, &Produtor.iniciar/1)
    Enum.each(1..2, &Consumidor.iniciar/1)
  end
end
