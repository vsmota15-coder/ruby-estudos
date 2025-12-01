# ========================================
#            BLOCOS EM RUBY
# ========================================

puts "="*60
puts "            BLOCOS EM RUBY"
puts "="*60

# ========================================
# 1. O QUE SÃO BLOCOS?
# ========================================

puts "\n1 - O QUE SÃO BLOCOS?"
puts "-"*60

puts "\nBlocos são 'pedaços de código' que você pode passar"
puts "para métodos como se fossem parâmetros!"
puts "\nVocê já usou blocos antes:"
puts "  [1,2,3].each do |num|"
puts "    puts num" 
puts "  end"
puts "\nO bloco é a parte: do |num| ... end"

# ========================================
# 2. DUAS SINTAXES DE BLOCOS
# ========================================

puts "\n" + "="*60
puts "2 - DUAS SINTAXES DE BLOCOS"
puts "-"*60

puts "\nSintaxe 1: do...end (múltiplas linhas)"
[1, 2, 3].each do |numero|
  puts "Número: #{numero}"
end

puts "\nSintaxe 2: { } (uma linha)"
[1, 2, 3].each { |numero| puts "Número: #{numero}" }

puts "\nRegra geral:"
puts "  • Use do...end para MÚLTIPLAS linhas"
puts "  • Use { } para UMA linha"

# ========================================
# 3. YIELD - EXECUTANDO BLOCOS
# ========================================

puts "\n" + "="*60
puts "3 - YIELD - EXECUTANDO BLOCOS"
puts "-"*60

def saudar
  puts "Antes do yield"
  yield  # Executa o bloco passado
  puts "Depois do yield"
end

puts "\nChamando com bloco:"
saudar do
  puts " -> 0 Olá do bloco!"
end

puts "\n"

# Método que usa yield múltiplas vezes
def repetir_3_vezes
  yield
  yield
  yield
end

puts "Repetindo 3 vezes:"
repetir_3_vezes do
  puts "   Ruby é legal!"
end

# ========================================
# 4. BLOCOS COM PARÂMETROS
# ========================================

puts "\n" + "="*60
puts "4 - BLOCOS COM PARÂMETROS"
puts "-"*60

def cumprimentar(nome)
  resultado = yield(nome)  # Passa argumento para o bloco
  puts "Resultado do bloco: #{resultado}"
end

puts "\nBloco que recebe parâmetro:"
cumprimentar("Maria") do |nome|
  "Olá, #{nome}! Bem-vinda!"
end

puts "\n"

# Método que passa múltiplos argumentos
def calcular(a, b)
  resultado = yield(a, b)
  puts "Cálculo: #{a} e #{b} = #{resultado}"
end

puts "Diferentes operações:"
calcular(5, 3) { |x, y| x + y }
calcular(5, 3) { |x, y| x * y }
calcular(5, 3) { |x, y| x ** y }

# ========================================
# 5. BLOCK_GIVEN? - VERIFICAR SE TEM BLOCO
# ========================================

puts "\n" + "="*60
puts "5 - BLOCK_GIVEN? - VERIFICAR SE TEM BLOCO"
puts "-"*60

def processar_numero(num)
  if block_given?
    puts "Com bloco: #{yield(num)}"
  else
    puts "Sem bloco: #{num}"
  end
end

puts "\nChamando com bloco:"
processar_numero(5) { |n| n * 2 }

puts "\nChamando sem bloco:"
processar_numero(5)

puts "\n"

# Exemplo prático: método flexível
def listar_numeros(array)
  array.each do |num|
    if block_given?
      yield(num)  # Deixa o bloco decidir o que fazer
    else
      puts num    # Comportamento padrão
    end
  end
end

numeros = [1, 2, 3, 4, 5]

puts "Sem bloco (padrão):"
listar_numeros(numeros)

puts "\nCom bloco (dobrados):"
listar_numeros(numeros) { |n| puts n * 2 }

puts "\nCom bloco (quadrados):"
listar_numeros(numeros) { |n| puts n ** 2 }

# ========================================
# 6. CRIANDO SEUS PRÓPRIOS ITERADORES
# ========================================

puts "\n" + "="*60
puts "6 - CRIANDO SEUS PRÓPRIOS ITERADORES"
puts "-"*60

# Iterador simples
def meu_each(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

puts "\nUsando meu_each:"
meu_each([10, 20, 30]) do |num|
  puts "Elemento: #{num}"
end

puts "\n"

# Iterador com índice
def meu_each_with_index(array)
  i = 0
  while i < array.length
    yield(array[i], i)
    i += 1
  end
end

puts "Com índice:"
meu_each_with_index(["a", "b", "c"]) do |letra, indice|
  puts "#{indice}: #{letra}"
end

puts "\n"

# Iterador que retorna nova array
def meu_map(array)
  resultado = []
  array.each do |elemento|
    resultado.push(yield(elemento))
  end
  resultado
end

puts "Meu map (dobrar valores):"
dobrados = meu_map([1, 2, 3, 4]) { |n| n * 2 }
puts dobrados.inspect

# ========================================
# 7. BLOCOS COM MÚLTIPLAS LINHAS
# ========================================

puts "\n" + "="*60
puts "7 - BLOCOS COM MÚLTIPLAS LINHAS"
puts "-"*60

def processar_usuarios(usuarios)
  usuarios.each do |usuario|
    yield(usuario)
  end
end

usuarios = [
  { nome: "Ana", idade: 25 },
  { nome: "Bruno", idade: 30 },
  { nome: "Carla", idade: 22 }
]

puts "\nProcessando usuários:"
processar_usuarios(usuarios) do |user|
  puts "─" * 40
  puts "Nome: #{user[:nome]}"
  puts "Idade: #{user[:idade]}"
  puts "Maior de idade? #{user[:idade] >= 18 ? 'Sim' : 'Não'}"
end

# ========================================
# 8. BLOCOS RETORNANDO VALORES
# ========================================

puts "\n" + "="*60
puts "8 - BLOCOS RETORNANDO VALORES"
puts "-"*60

def executar_com_tempo
  inicio = Time.now
  resultado = yield  # Captura o retorno do bloco
  fim = Time.now
  tempo = fim - inicio
  
  puts "Resultado: #{resultado}"
  puts "Tempo: #{tempo.round(4)} segundos"
end

puts "\nExecutando com medição de tempo:"
executar_com_tempo do
  soma = 0
  10000.times { soma += 1 }
  soma
end

# ========================================
# 9. EXEMPLO PRÁTICO: VALIDADOR
# ========================================

puts "\n" + "="*60
puts "9 - EXEMPLO: VALIDADOR CUSTOMIZÁVEL"
puts "-"*60

def validar(valor, nome_campo)
  if block_given?
    if yield(valor)
      puts " #{nome_campo} válido: #{valor}"
      return true
    else
      puts " #{nome_campo} inválido: #{valor}"
      return false
    end
  else
    puts "  Sem validação definida"
    return true
  end
end

puts "\nValidando idade:"
validar(25, "Idade") { |idade| idade >= 18 && idade <= 120 }
validar(150, "Idade") { |idade| idade >= 18 && idade <= 120 }

puts "\nValidando email:"
validar("usuario@email.com", "Email") { |email| email.include?("@") }
validar("emailinvalido", "Email") { |email| email.include?("@") }

puts "\nValidando senha:"
validar("abc", "Senha") { |senha| senha.length >= 6 }
validar("senha123", "Senha") { |senha| senha.length >= 6 }

# ========================================
# 10. EXEMPLO: MENU CUSTOMIZÁVEL
# ========================================

puts "\n" + "="*60
puts " EXEMPLO: MENU COM BLOCOS"
puts "-"*60

def criar_menu(titulo)
  puts "\n|" + "═" * 50 + "|"
  puts "| #{titulo.center(50)} |"
  puts "|" + "═" * 50 + "|"
  
  if block_given?
    yield  # Executa o bloco que define as opções
  end
  
  puts "|-" + "═" * 50 + "-|"
end

def opcao(numero, texto)
  puts "|  #{numero}. #{texto.ljust(46)} |"
end

criar_menu("SISTEMA DE GERENCIAMENTO") do
  opcao(1, "Cadastrar usuário")
  opcao(2, "Listar usuários")
  opcao(3, "Editar usuário")
  opcao(4, "Remover usuário")
  opcao(0, "Sair")
end

criar_menu("CALCULADORA") do
  opcao(1, "Somar")
  opcao(2, "Subtrair")
  opcao(3, "Multiplicar")
  opcao(4, "Dividir")
end

# ========================================
# 11. EXERCÍCIO: FILTRO CUSTOMIZÁVEL
# ========================================

puts "\n" + "="*60
puts " EXERCÍCIO: FILTRO COM BLOCOS"
puts "-"*60

def filtrar(array, nome_filtro)
  puts "\nAplicando filtro: #{nome_filtro}"
  resultado = []
  
  array.each do |elemento|
    if yield(elemento)
      resultado.push(elemento)
    end
  end
  
  puts "Resultado: #{resultado}"
  resultado
end

numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

filtrar(numeros, "Números pares") do |num|
  num % 2 == 0
end

filtrar(numeros, "Maiores que 5") do |num|
  num > 5
end

filtrar(numeros, "Múltiplos de 3") do |num|
  num % 3 == 0
end

puts "\n"

# Com array de hashes
produtos = [
  { nome: "Notebook", preco: 3000 },
  { nome: "Mouse", preco: 50 },
  { nome: "Teclado", preco: 200 },
  { nome: "Monitor", preco: 1000 }
]

filtrar(produtos, "Preço maior que 100") do |produto|
  produto[:preco] > 100
end

filtrar(produtos, "Nome com 'o'") do |produto|
  produto[:nome].downcase.include?("o")
end

# ========================================
# RESUMO
# ========================================

puts "\n" + "="*60
puts " RESUMO - BLOCOS"
puts "="*60
puts "\n Blocos são pedaços de código passados para métodos"
puts " Sintaxe: do...end (múltiplas linhas) ou { } (uma linha)"
puts " yield - Executa o bloco dentro do método"
puts " yield(args) - Passa argumentos para o bloco"
puts " block_given? - Verifica se bloco foi passado"
puts " Blocos podem receber parâmetros: { |x| ... }"
puts " Blocos podem retornar valores"
puts " Use blocos para criar código flexível e reutilizável"
puts "="*60