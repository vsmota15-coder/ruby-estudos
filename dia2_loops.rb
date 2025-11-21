#-------LOOPS EM RUBY------

#===== 1 - WHILE (Enquanto a condição for verdadeira)=====

puts "="*50
puts "LOOP WHILE"
puts "="*50

# Exemplo 1: Contador simples
contador = 1

while contador <= 5
  puts "Contagem: #{contador}"
  contador += 1  # Mesmo que: contador = contador + 1
end

puts "\n"

# Exemplo 2: Pedindo senha
tentativas = 0
senha_correta = "ruby123"

while tentativas < 3
  print "Digite a senha: "
  senha = gets.chomp
  
  if senha == senha_correta
    puts " Acesso permitido!"
    break  # Sai do loop
  else
    tentativas += 1
    puts " Senha incorreta. Tentativa #{tentativas}/3"
  end
end

puts "\n" + "="*50 + "\n"

#2 ===== - LOOP/BREAK - loop infinito com parada =====

puts "LOOP/BREAK"
puts "="*50

#Exemplo 1: Menu com loop infinito
opcao = 0

loop do
  puts "\n--- MENU ---"
   puts "1. Opção A"
  puts "2. Opção B"
  puts "0. Sair"
  print "Escolha: "
  opcao = gets.chomp.to_i

  if opcao == 1
    puts "Você escolheu A"
  elsif opcao == 2
    puts "Você escolheu B"
  elsif opcao == 0
    puts "Saindo..."
    break  # Para o loop
  else
    puts "Opção inválida!"
  end
end

puts "\n"

# Exemplo 2: Loop com next (pula para próxima iteração)
numero = 0

loop do
  numero += 1
  
  if numero > 10
    break  # Para quando passar de 10
  end
  
  if numero % 2 == 0
    next  # Pula números pares
  end
  
  puts "Número ímpar: #{numero}"
end

puts "\n" + "="*50 + "\n"

# ===== 3. FOR - Percorre uma sequência ======

puts "LOOP FOR"
puts "="*50

# Exemplo 1: For com range (intervalo)
puts "Contando de 1 a 5:"
for i in 1..5
  puts "Número: #{i}"
end

puts "\n"

# Exemplo 2: For com array
frutas = ["maçã", "banana", "laranja", "uva"]

puts "Frutas na lista:"
for fruta in frutas
  puts "- #{fruta}"
end

puts "\n"

# Exemplo 3: For com range e step (pular números)
puts "Números pares de 0 a 10:"
for num in (0..10).step(2)
  puts num
end

puts "\n" + "="*50 + "\n"

# ===== 4 - .TIMES (REPETIR N VEZES) =====

puts "MÉTODO .TIMES"
puts "="*50

# Exemplo 1: Repetir ação 5 vezes
5.times do
  puts "Ruby é incrível! "
end

puts "\n"

# Exemplo 2: .times com índice
puts "Contagem com .times:"
5.times do |i|
  puts "Iteração número: #{i}"  # Começa em 0
end

puts "\n"

# Exemplo 3: Desenhar linha
print "Desenhando: "
10.times do
  print "* "
end
puts "\n"

puts "\n" + "="*50 + "\n"

# ===== 5 .EACH - Percorrer coleções =====

puts "MÉTODO .EACH"
puts "="*50

# Exemplo 1: .each com array
animais = ["gato", "cachorro", "coelho", "pássaro"]

puts "Lista de animais:"
animais.each do |animal|
  puts " #{animal}"
end

puts "\n"

# Exemplo 2: .each com índice
puts "Animais com posição:"
animais.each_with_index do |animal, indice|
  puts "#{indice + 1}. #{animal}"
end

puts "\n"

# Exemplo 3: .each modificando valores
numeros = [1, 2, 3, 4, 5]
dobrados = []

numeros.each do |num|
  dobrados.push(num * 2)
end

puts "Números originais: #{numeros}"
puts "Números dobrados: #{dobrados}"

puts "\n" + "="*50 + "\n"

# ========================================
# 6. EXERCÍCIO 1: TABUADA
# ========================================

puts " GERADOR DE TABUADA "
puts "="*50

print "\nDigite um número para ver a tabuada: "
numero = gets.chomp.to_i

puts "\nTabuada do #{numero}:"
puts "-" * 30

# Usando .times
10.times do |i|
  multiplicador = i + 1
  resultado = numero * multiplicador
  puts "#{numero} x #{multiplicador} = #{resultado}"
end

# Alternativa com for
puts "\n--- Usando FOR ---"
for i in 1..10
  puts "#{numero} x #{i} = #{numero * i}"
end

# Alternativa com while
puts "\n--- Usando WHILE ---"
contador = 1
while contador <= 10
  puts "#{numero} x #{contador} = #{numero * contador}"
  contador += 1
end

puts "\n" + "="*50 + "\n"

# ========================================
# 7. EXERCÍCIO 2: CONTADOR REGRESSIVO
# ========================================

puts " CONTADOR REGRESSIVO "
puts "="*50

print "\nDigite o número inicial da contagem: "
inicio = gets.chomp.to_i

puts "\nIniciando contagem regressiva de #{inicio}...\n"
sleep(1)  # Pausa de 1 segundo

# Usando downto
inicio.downto(0) do |num|
  if num == 0
    puts " FOGO! "
  else
    puts num
    sleep(0.5)  # Pausa entre números
  end
end

puts "\n--- Alternativa com WHILE ---"
contador_regr = inicio

while contador_regr >= 0
  if contador_regr == 0
    puts " BOOM!"
  else
    puts contador_regr
  end
  contador_regr -= 1
  sleep(0.5)
end

puts "\n" + "="*50 + "\n"

# ========================================
# 8. COMPARAÇÃO DE LOOPS
# ========================================

puts " RESUMO DOS LOOPS"
puts "="*50

puts "\n1. WHILE - Use quando NÃO sabe quantas repetições"
puts "   Exemplo: Verificar senha até acertar"

puts "\n2. LOOP/BREAK - Use para loops infinitos com condição de saída"
puts "   Exemplo: Menus que ficam rodando"

puts "\n3. FOR - Use para percorrer ranges ou arrays"
puts "   Exemplo: Números de 1 a 10"

puts "\n4. .TIMES - Use quando sabe EXATAMENTE quantas vezes repetir"
puts "   Exemplo: Fazer algo 5 vezes"

puts "\n5. .EACH - Use para percorrer ARRAYS (mais usado!)"
puts "   Exemplo: Listar todos os elementos"

puts "\n" + "="*50

