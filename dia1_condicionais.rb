# ===== CONDICIONAIS EM RUBY =====

# ===== IF / ELSIF / ELSE =====
idade = 20

if idade >= 18
  puts "Você é maior de idade"
elsif idade >= 16
  puts "Você pode votar opcionalmente"
else
  puts "Você é menor de idade"
end


# ===== OPERADORES DE COMPARAÇÃO =====
# == (igual)
# != (diferente)
# > (maior)
# < (menor)
# >= (maior ou igual)
# <= (menor ou igual)

numero = 10

if numero == 10
  puts "O número é exatamente 10"
end

if numero != 5
  puts "O número é diferente de 5"
end

if numero > 5
  puts "O número é maior que 5"
end


# ===== OPERADORES LÓGICOS =====
# && (E - ambas condições precisam ser verdadeiras)
# || (OU - pelo menos uma condição precisa ser verdadeira)
# ! (NÃO - inverte o valor booleano)

idade = 25
tem_carteira = true

if idade >= 18 && tem_carteira
  puts "Pode dirigir!"
end

if idade < 18 || !tem_carteira
  puts "Não pode dirigir"
end


# ===== EXEMPLOS PRÁTICOS =====

# Exemplo 1: Verificar temperatura
temperatura = 30

if temperatura > 30
  puts "Está muito quente!"
elsif temperatura > 20
  puts "Está agradável"
elsif temperatura > 10
  puts "Está frio"
else
  puts "Está muito frio!"
end


# Exemplo 2: Login simples
usuario = "admin"
senha = "1234"

if usuario == "admin" && senha == "1234"
  puts "Login bem-sucedido!"
else
  puts "Usuário ou senha incorretos"
end


# Exemplo 3: Desconto em compra
valor_compra = 150.0
tem_cupom = true

if valor_compra > 100 && tem_cupom
  desconto = valor_compra * 0.15
  puts "Desconto de 15%: R$ #{desconto}"
elsif valor_compra > 100
  desconto = valor_compra * 0.10
  puts "Desconto de 10%: R$ #{desconto}"
elsif tem_cupom
  desconto = valor_compra * 0.05
  puts "Desconto de 5%: R$ #{desconto}"
else
  puts "Sem desconto disponível"
end


# Exemplo 4: Par ou ímpar
numero = 7

if numero % 2 == 0
  puts "#{numero} é par"
else
  puts "#{numero} é ímpar"
end


# Exemplo 5: Faixa de notas
nota = 7.5

if nota >= 9
  puts "Excelente!"
elsif nota >= 7
  puts "Bom!"
elsif nota >= 5
  puts "Aprovado"
else
  puts "Reprovado"
end

#------SISTEMA DE NOTAS (exercicio)-----

puts " =====SISTEMA DE APROVAÇÃO===="
puts " "

puts "Digite seu nome:"
nome = gets.chomp

puts "Digite sua nota(0 a 10):"
nota = gets.chomp.to_f

puts" "

if nota >= 7
  puts "#{nome}, você foi APROVADO!"
  puts "Sua nota: #{nota}"
elsif nota >=5
  puts "#{nome}, você está em RECUPERAÇÃO!"
  puts "Sua nota: #{nota}"
  puts "Você precisa de pelo menos 5 pontos na prova de recuperação!"
else
  puts "#{nome}, Você foi REPROVADO!"
  puts "Sua nota #{nota}"
end