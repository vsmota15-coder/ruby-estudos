#======================
# Guia Completo em Ruby
#======================

puts "="*60
puts "          Métodos em Ruby"
puts "="*60

# 1. O QUE SÃO MÉTODOS  

puts "\n1 - O QUE SÃO MÉTODOS "
puts "-"*60
puts "\nMétodos são blocos de código REUTILIZÁVEIS"
puts "Pense como uma 'receita' que você cria uma vez"
puts "e pode usar várias vezes!"
puts "\nVantagens:"
puts " .  Evita repetição de código"
puts " .  Organiza melhor o programa"
puts " .  Facilita manutenção"
puts " .  Deixa o código mais legível"

# ========================
# 2 - CRIAR MÉTODO SIMPLES
# ========================

puts "\n" + "="*60
puts " 2 - CRIAR MÉTODOS SIMPLES"
puts "-"*60

# Método sem parâmetros e sem retorno
def saudacao 
  puts "Olá! Seja bem vindo ao Ruby!"
end

# Chamando o método 
puts "\nChamando o método 'saudacao':"
saudacao

puts "\n"

# Método que retorna valor

def obter_nome_linguagem
  return "Ruby"
end

linguagem = obter_nome_linguagem
puts "Método retornou: #{linguagem}"

puts "\n"

#-------------------------------
#def galo                      |
  #return "Maior de minas"     |
#end                           |
#                              |
#Maior = galo                  |
#puts "Definiçaõ: #{Maior}"    |
#-------------------------------

# Método com retorno implícito (sem usar 'return')
def obter_versao
  "3.0"  # Última linha é retornada automaticamente
end

puts "Versão: #{obter_versao}"

# ==================================
# 3 - MÉTODOS COM PARÂMETROS
# ==================================

puts "\n" + "="*60
puts "3 - MÉTODOS COM PARÂMETROS"
puts "-"*60

# Método com 1 parâmetro
def saudar_pessoa(nome)
  puts "Olá, #{nome}! Como vai?"
end

puts "\nMétodo com 1 parâmetro:"
saudar_pessoa("Maria")
saudar_pessoa("João")

puts "\n"

# Método com múltiplos parâmetros
def calcular_soma(a, b)
  resultado = a + b
  return resultado
end

puts "Soma de 5 + 3 = #{calcular_soma(5, 3)}"
puts "Soma de 10 + 20 = #{calcular_soma(10, 20)}"

puts "\n"

# Método com parâmetros padrão
def criar_mensagem(texto, prefixo = "INFO")
  return "[#{prefixo}] #{texto}"
end

puts criar_mensagem("Sistema iniciado")  # Usa padrão "INFO"
puts criar_mensagem("Erro encontrado", "ERRO")  # Usa "ERRO"
puts criar_mensagem("Tudo certo!", "SUCESSO")

# ========================================
# 4 - MÉTODOS QUE RETORNAM VALORES 
# ========================================

puts "\n" + "="*60
puts "4️ - MÉTODOS QUE RETORNAM VALORES"
puts "-"*60

# Método que calcula área
def calcular_area_retangulo(largura, altura)
  area = largura * altura
  return area
end

area1 = calcular_area_retangulo(5, 3)
puts "\nÁrea do retângulo 5x3: #{area1}"

puts "\n"

# Método que retorna múltiplos valores (array)
def obter_dados_pessoa
  nome = "Carlos"
  idade = 28
  cidade = "São Paulo"
  return nome, idade, cidade  # Retorna array
end

nome, idade, cidade = obter_dados_pessoa
puts "Nome: #{nome}"
puts "Idade: #{idade}"
puts "Cidade: #{cidade}"

puts "\n"

# Método que retorna hash
def criar_produto(nome, preco)
  return {
    nome: nome,
    preco: preco,
    estoque: 0
  }
end

produto = criar_produto("Notebook", 3500)
puts "Produto criado: #{produto}"

#=====================================
# 5 - MÉTODOS COM VALIDAÇÕES 
#=====================================

puts "\n" + "="*60
puts "5 - MÉTODOS COM VALIDAÇÕES"
puts "-"*60

# Método que valida idade
def validar_idade(idade)
  if idade < 0
    return "Idade inválida!"
  elsif idade < 18
    return "Menor de idade"
  elsif idade >= 18 && idade < 60
    return "Adulto"
  else
    return "Idoso"
  end
end

puts "\nValidando idades:"
puts "Idade 15: #{validar_idade(15)}"
puts "Idade 25: #{validar_idade(25)}"
puts "Idade 70: #{validar_idade(70)}"
puts "Idade -5: #{validar_idade(-5)}"

puts "\n"

# Método que calcula média e retorna situação
def calcular_situacao(nota1, nota2, nota3)
  media = (nota1 + nota2 + nota3) / 3.0
  
  if media >= 7.0
    situacao = "Aprovado"
  elsif media >= 5.0
    situacao = "Recuperação"
  else
    situacao = "Reprovado"
  end
  
  return media.round(2), situacao
end

media, situacao = calcular_situacao(8, 7, 9)
puts "Média: #{media} - Situação: #{situacao}"

# ========================================
# 6. MÉTODOS COM ARRAYS
# ========================================

puts "\n" + "="*60
puts "6 - MÉTODOS COM ARRAYS"
puts "-"*60

# Método que encontra o maior número
def encontrar_maior(numeros)
  return nil if numeros.empty?
  
  maior = numeros[0]
  numeros.each do |num|
    if num > maior
      maior = num
    end
  end
  return maior
end

lista = [45, 23, 89, 12, 67]
puts "\nLista: #{lista}"
puts "Maior número: #{encontrar_maior(lista)}"

puts "\n"

# Método que filtra números pares
def filtrar_pares(numeros)
  pares = []
  numeros.each do |num|
    if num % 2 == 0
      pares.push(num)
    end
  end
  return pares
end

numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Números: #{numeros}"
puts "Apenas pares: #{filtrar_pares(numeros)}"

puts "\n"

# Método que conta ocorrências
def contar_ocorrencias(array, elemento)
  contador = 0
  array.each do |item|
    if item == elemento
      contador += 1
    end
  end
  return contador
end

frutas = ["maçã", "banana", "maçã", "laranja", "maçã"]
puts "Frutas: #{frutas}"
puts "Quantas maçãs? #{contar_ocorrencias(frutas, "maçã")}"

# ========================================
# 7. MÉTODOS COM HASHES
# ========================================

puts "\n" + "="*60
puts "7 - MÉTODOS COM HASHES"
puts "-"*60

# Método que cria perfil de usuário
def criar_perfil(nome, email, idade)
  perfil = {
    nome: nome,
    email: email,
    idade: idade,
    ativo: true,
    data_cadastro: Time.now.strftime("%d/%m/%Y")
  }
  return perfil
end

usuario = criar_perfil("Ana Silva", "ana@email.com", 25)
puts "\nPerfil criado:"
usuario.each do |chave, valor|
  puts "  #{chave}: #{valor}"
end

puts "\n"

# Método que atualiza hash
def atualizar_estoque(produto, quantidade)
  produto[:estoque] += quantidade
  produto[:ultima_atualizacao] = Time.now.strftime("%d/%m/%Y %H:%M")
  return produto
end

item = { nome: "Caneta", preco: 2.50, estoque: 10 }
puts "Produto antes: #{item}"
atualizar_estoque(item, 5)
puts "Produto depois: #{item}"

# ========================================
# 8. MÉTODOS COM BLOCOS
# ========================================

puts "\n" + "="*60
puts "8 - MÉTODOS COM BLOCOS"
puts "-"*60

# Método que aceita bloco com yield
def repetir(vezes)
  vezes.times do |i|
    yield(i)  # Executa o bloco passado
  end
end

puts "\nUsando método com bloco:"
repetir(3) do |numero|
  puts "Repetição número #{numero + 1}"
end

puts "\n"

# Método para processar lista
def processar_lista(array)
  resultado = []
  array.each do |item|
    resultado.push(yield(item))
  end
  return resultado
end

numeros = [1, 2, 3, 4, 5]
dobrados = processar_lista(numeros) { |n| n * 2 }
puts "Números originais: #{numeros}"
puts "Números dobrados: #{dobrados}"

# ========================================
# 9. ESCOPO DE VARIÁVEIS
# ========================================

puts "\n" + "="*60
puts "9 - ESCOPO DE VARIÁVEIS"
puts "-"*60

# Variável global (evite usar!)
$variavel_global = "Acessível em todo lugar"

# Variável local do script
variavel_local = "Só existe aqui"

def testar_escopo
  # Variável local do método
  dentro_metodo = "Só existe dentro do método"
  
  puts "Dentro do método:"
  puts "  Global: #{$variavel_global}"
  # puts "  Local script: #{variavel_local}"  # ERRO! Não acessa
  puts "  Local método: #{dentro_metodo}"
end

puts "\nTestando escopo:"
testar_escopo

# ========================================
# 10. EXERCÍCIO PRÁTICO
# ========================================

puts "\n" + "="*60
puts " EXERCÍCIO PRÁTICO: CALCULADORA"
puts "-"*60

def somar(a, b)
  a + b
end

def subtrair(a, b)
  a - b
end

def multiplicar(a, b)
  a * b
end

def dividir(a, b)
  if b == 0
    return "Erro: Divisão por zero!"
  end
  (a.to_f / b).round(2)
end

def calcular(operacao, num1, num2)
  case operacao
  when "+"
    return somar(num1, num2)
  when "-"
    return subtrair(num1, num2)
  when "*"
    return multiplicar(num1, num2)
  when "/"
    return dividir(num1, num2)
  else
    return "Operação inválida!"
  end
end

puts "\n Calculadora:"
puts "10 + 5 = #{calcular("+", 10, 5)}"
puts "10 - 5 = #{calcular("-", 10, 5)}"
puts "10 * 5 = #{calcular("*", 10, 5)}"
puts "10 / 5 = #{calcular("/", 10, 5)}"
puts "10 / 0 = #{calcular("/", 10, 0)}"

# ========================================
# RESUMO
# ========================================

puts "\n" + "="*60
puts " RESUMO - MÉTODOS EM RUBY"
puts "="*60
puts "\n def nome_metodo - Define um método"
puts " def metodo(param) - Método com parâmetro"
puts " def metodo(a, b = 10) - Parâmetro com valor padrão"
puts " return valor - Retorna um valor"
puts " Última linha retorna automaticamente"
puts " Métodos organizam e reutilizam código"
puts " Use nomes descritivos e claros"
puts "="*60

