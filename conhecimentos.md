# FILE

    File.read("arquivo.txt")
    retorna uma tupla com um atom indicando o resultado e o elemento que é retorno da leitura.
    {:ok, "Isso é um texto \r\nDei um enter"}
    File.read!("arquivo.txt")

# KEYWORD LIST
    lista = [{:a, "Valor"}, {:b, "valor2}]
    Chave - Valor
    Compostos de atom e valor atribuído.
    Como em um Json.

# MAPS - chave e valor
## usando atoms:
    x = %{a: 1, b: 2}
    %{b: 2, a: 1}

    iex(56)> x[:a]                             
    1

    iex(57)> x[:b]
    2

    iex(4)> x= Map.put(x, :cor, "Vermelho")                                                                                                                                                                                          
    %{b: 2, a: 1, cor: "Vermelho"}
## Usando strings:
    iex(58)> y = %{"a" => 1, "b" => 2}
    %{"a" => 1, "b" => 2}

    iex(59)> y[:a]
    RETORNA NIL

    iex(60)> y["a"]
    1


# ENUM
    colecao = [1,15,14,33,98,44,331,7,4,3,11,22,31,9,87,44,32,65,41,44,88,90,70,50]

    ## Sort
    Enum.sort(colecao) =  organiza de forma asc
    Enum.sort(colecao, :desc ) organiza de forma desc

    ## Map
    Enum.map(colecao, fn elem -> elem + 1 end) função anonima para cada item da colecao, passa adicionando um e encerra no end

    ## Reduce
    ** SOMA TODOS OS ELEMENTOS DA LISTA AO ACUMULADOR.
    Enum.reduce([2,5,8,14,3,4,2,1,-8], 0, fn elem, acc -> acc + elem end)

    ** Resulta num acumulador que é um mapa com chave e valor lidas do mapa original, adicionando 1 ao valor.
    Enum.reduce(%{a: 11, b: 22}, %{}, fn {chave, valor}, acc -> Map.put(acc, chave, valor+1) end)

    ** soma os valores a si mesmos, salvando-os em acumulador
    Enum.reduce(%{a: 11, b: 22}, %{}, fn {chave, valor}, acc -> Map.put(acc, chave, valor+valor) end)

# PATTERN MATCHING
    ** Usando para testar arquivo e exibir conteúdo:
    iex(9)> testa_arquivo = fn
    ...(9)> {:ok, conteudo} -> "O conteudo do arquivo é: #{conteudo}"
    ...(9)> {:error, reason} -> "Arquivo não lido, erro: #{reason}"
    ...(9)> end 
    
    iex(10)> testa_arquivo.(File.read("arquivo.txt"))
    "O conteudo do arquivo é: Isso é um texto \r\nDei um enter"

    iex(11)> testa_arquivo.(File.read("arquivos.txt"))
    "Arquivo não lido, erro: enoent"

# PIPE OPERATOR