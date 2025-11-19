# ===== CONDICIONAIS AVANÇADOS EM RUBY =====

# ===== UNLESS (a menos que / se não) =====
# É o contrário do IF - executa quando a condição é FALSA

idade = 16

unless idade >= 18
  puts "Você não pode entrar (é menor de idade)"
end

# É o mesmo que:
# if idade < 18
#   puts "Você não pode entrar"
# end


esta_chovendo = false

unless esta_chovendo
  puts "Pode sair sem guarda-chuva!"
end


# ===== CASE / WHEN (switch case) =====
# Melhor que vários IF/ELSIF quando você compara a MESMA variável

puts "=== EXEMPLO 1: Dia da Semana ==="
dia = 3

case dia
when 1
  puts "Segunda-feira"
when 2
  puts "Terça-feira"
when 3
  puts "Quarta-feira"
when 4
  puts "Quinta-feira"
when 5
  puts "Sexta-feira"
when 6, 7  # Múltiplos valores
  puts "Final de semana!"
else
  puts "Dia inválido"
end


puts ""
puts "=== EXEMPLO 2: Conceito por Nota ==="
nota = 8.5

case nota
when 9..10  # Range (intervalo)
  puts "Conceito A - Excelente!"
when 7...9  # ... exclui o último número
  puts "Conceito B - Bom!"
when 5...7
  puts "Conceito C - Regular"
when 0...5
  puts "Conceito D - Insuficiente"
else
  puts "Nota inválida"
end


puts ""
puts "=== EXEMPLO 3: Tipo de Variável ==="
valor = "texto"

case valor
when String
  puts "É uma string"
when Integer
  puts "É um número inteiro"
when Float
  puts "É um número decimal"
else
  puts "Tipo desconhecido"
end


# ===== OPERADOR TERNÁRIO (IF/ELSE em uma linha) =====
# condição ? valor_se_verdadeiro : valor_se_falso

idade = 20
status = idade >= 18 ? "Maior de idade" : "Menor de idade"
puts status

nota = 7
resultado = nota >= 6 ? "Aprovado" : "Reprovado"
puts "Você está #{resultado}"

temperatura = 25
roupa = temperatura > 20 ? "Camiseta" : "Casaco"
puts "Use: #{roupa}"


# ===== COMPARAÇÃO: IF vs UNLESS vs TERNÁRIO =====

saldo = 100

# Com IF
if saldo > 0
  puts "Você tem saldo positivo"
end

# Com UNLESS
unless saldo <= 0
  puts "Você tem saldo positivo"
end

# Com TERNÁRIO
mensagem = saldo > 0 ? "Saldo positivo" : "Sem saldo"
puts mensagem


# ===== MENU DE RESTAURANTE (EXERCÍCIO) =====

puts "╔════════════════════════════════╗"
puts "║   RESTAURANTE BOM SABOR        ║"
puts "╚════════════════════════════════╝"
puts ""
puts "MENU:"
puts "1 - Pizza (R$ 35,00)"
puts "2 - Hambúrguer (R$ 25,00)"
puts "3 - Massa (R$ 30,00)"
puts "4 - Salada (R$ 20,00)"
puts "5 - Suco (R$ 8,00)"
puts ""

puts "Digite o número do item:"
opcao = gets.chomp.to_i

puts "Digite a quantidade:"
quantidade = gets.chomp.to_i

puts ""

case opcao
when 1
  item = "Pizza"
  preco = 35.0
when 2
  item = "Hambúrguer"
  preco = 25.0
when 3
  item = "Massa"
  preco = 30.0
when 4
  item = "Salada"
  preco = 20.0
when 5
  item = "Suco"
  preco = 8.0
else
  puts "❌ Opção inválida!"
  exit  # Encerra o programa
end

total = preco * quantidade

puts "═══════════════════════════════"
puts "Pedido: #{quantidade}x #{item}"
puts "Valor unitário: R$ #{preco}"
puts "TOTAL: R$ #{total}"
puts "═══════════════════════════════"

# Verifica desconto
desconto_aplicado = total > 50 ? "Você ganhou 10% de desconto!" : "Sem desconto"
puts desconto_aplicado

if total > 50
  total_com_desconto = total * 0.9
  puts "Total com desconto: R$ #{total_com_desconto.round(2)}"
end
