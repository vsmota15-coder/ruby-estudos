#=======Arrays em Ruby=======

#=======================
# 1 - CRIAR ARRAYS
#=======================

# Array vazio 

frutas = []
puts "Array vazio  #{frutas}"  

# Array com elementos
numeros = [1, 2, 3, 4, 5]
puts "Array de números #{numeros}"

# Array com diferentes tipos
misturado = ["texto", 42, true, 3.14]
puts "Array misto #{misturado}"

# Usando Array.new
idades = Array.new
puts "Array novo : #{idades}"

puts "\n" + "="*50 + "\n"

# ======= 2 - ACESSAR ELEMENTOS(ÍNDICES)=======
cores = ["vermelho", "azul", "verde", "amarelo"]

# Acessar por índice (começa pelo 0)

puts "Primeira cor (índice 0) #{cores[0]}"
puts "Segunda cor (índice 1) #{cores[1]}"
puts "Terceira cor (índice 2) #{cores[2]}"

# Índices negativos (contam de trás para frente)

puts "Última cor (índice -1) #{cores[-1]}"
puts "Penúltima cor (índice -2) #{cores[-2]}"

puts "\n" + "="*50 + "\n"

#======3 - Métodos importantes ======

#----- .push (adiciona no final) ---

animais = ["gato", "cachorro"]
puts "Array inicial : #{animais}"

animais.push("coelho")
puts "Depois do .push('coelho'): #{animais}"

animais.push("pássaro", "peixe")
puts "Depois de .push mútliplos: #{animais}"

# Alternativa ao push: usar <<
animais << "hamster"
puts "Usando << para adicionar: #{animais}"

puts "\n" + "="*50 + "\n"

# --- .length (tamanho do array) ---
puts "Quantidade de animais: #{animais.length}"
puts "Outra forma (.size): #{animais.size}"
puts "Verificar se está vazio (.empty?): #{animais.empty?}"

puts "\n" + "="*50 + "\n"

# --- .first (primeiro elemento) ---
carros = ["Fusca", "Civic", "Gol", "Corolla"]
puts "Array de carros: #{carros}"
puts "Primeiro carro (.first): #{carros.first}"
puts "Primeiros 2 carros (.first(2)): #{carros.first(2)}"

puts "\n" + "="*50 + "\n"

# --- .last (último elemento) ---
puts "Último carro (.last): #{carros.last}"
puts "Últimos 3 carros (.last(3)): #{carros.last(3)}"

puts "\n" + "="*50 + "\n"

#-----4 - Outros métodos úteis-----

numeros = [10, 20, 30, 40]

# .pop (remove o último)
removido = numeros.pop
puts "Removido com .pop: #{removido}"
puts "Array após .pop: #{numeros}"

# .shift (remove o primeiro)
primeiro = numeros.shift
puts "Removido com .shift: #{primeiro}"
puts "Array após .shift: #{numeros}"

# .unshift (adiciona no início)
numeros.unshift(5)
puts "Array após .unshift(5): #{numeros}"

# .include? (verifica se contém)
puts "Contém 30? #{numeros.include?(30)}"
puts "Contém 100? #{numeros.include?(100)}"

puts "\n" + "="*50 + "\n"

# ========================================
# 5. EXERCÍCIO: LISTA DE COMPRAS INTERATIVA
# ========================================

puts " LISTA DE COMPRA INTERATIVA "
puts "="*50

lista_compras = []

loop do
  puts "\nO que você deseja fazer?"
  puts "1 - Adicionar item"
  puts "2 - Ver lista completa"
  puts "3 - Ver primeiro item"
  puts "4 - Ver último item"
  puts "5 - Ver quantidade de itens"
  puts "6 - Remover último item"
  puts "7 - Verificar se item está na lista"
  puts "0 - Sair"
  print " Escolha uma opção: "

  opcao = gets.chomp.to_i

  case opcao
  when 1 
    print "Digite o item para adicionar: "
    item = gets.chomp
    lista_compras.push(item)
     puts "OK '#{item}' adicionado à lista!"

  when 2
    if lista_compras.empty?
      puts " A lista está vazia!"
    else
      puts "\n Sua lista de compras:"
      lista_compras.each_with_index do |item, indice|
        puts "  #{indice + 1}. #{item}"
      end
    end
   
  when 3
    if lista_compras.empty?
      puts " A lista está vazia!"
    else
      puts " Primeiro item: #{lista_compras.first}"
    end
  
  when 4
    if lista_compras.empty?
      puts " A lista está vazia!"
    else
      puts " Último item: #{lista_compras.last}"
    end

  when 5
    puts " Quantidade de itens: #{lista_compras.length}"

  when 6
    if lista_compras.empty?
      puts " A lista está vazia!"
    else
      removido = lista_compras.pop
      puts " '#{removido}' foi removido da lista!"
    end

  when 7
    print "Digite o item para verificar: "
    busca = gets.chomp
    if lista_compras.include?(busca)
      puts " '#{busca}' está na lista!"
    else
      puts " '#{busca}' NÃO está na lista!"
    end

   when 0
    puts "\n Saindo... Até logo!"
    break
    
  else
    puts " Opção inválida! Tente novamente."
  end
end

puts "\n Lista final de compras: #{lista_compras}"