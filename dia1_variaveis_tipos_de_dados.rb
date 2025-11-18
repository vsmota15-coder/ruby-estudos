#-------STRINGS(textos)-------
nome = "Vitor"
sobrenome = "Mota"
frase = "Ola mundo!"
mensagem = "Eu tenho #{20} anos"   #interpolação

puts "Meu nome é #{nome}"

#------INTENGERS(números inteiros)------
idade = 20
ano = 2025
quantidade = 100
negativo = -50

puts "Idade: #{idade}"

#-------FLOATS(números decimais)-----
altura = 1.83
peso = 91.5
preco = 19.99
temperatura = 5.3

puts "Altura : #{altura}m"

#-------BOOLEANS------
esta_logado = true
tem_desconto = false
maior_idade = true

puts "Está logado? #{esta_logado}"

#------CONVERSÕES------
# String para Integer
texto_numero = "123"
numero = texto_numero.to_i
puts "Convertido : #{numero + 10}"#133

# Integer para String 
idade_num = 25
idade_texto = idade_num.to_s
puts "Idade como texto: #{idade_texto}"

# String para Float 

preco_texto = 19.99
preco_float = preco_texto.to_f
puts "Preço: R$ #{preco_float}"

# Float para integer (remove decimais)

valor = 19.99
valor_inteiro = valor.to_i
puts "Valor inteiro #{valor_inteiro}" #19

#--------OPERAÇÕES-------
#Com Integers
soma = 10 + 5 #15
subtracao = 10 - 5   #5
multiplicacao = 10 * 5  #50
divisao = 10 / 5 #2
resto = 10 % 3  #1

#Com Floats

preco_total = 19.99 * 2  #39.98
desconto = 100.0 - 15.5  #84.5

#Com Strings

nome_completo = nome + " " + sobrenome  #Vitor Mota
grito = "oi " * 3 # oi oi oi 

puts "Soma: #{soma}"
puts "Nome completo: #{nome_completo}"

#----CALCULADORA DE TROCO DE COMPRA -----

puts " =====CALCULADORA DE TROCO===="
puts""

# Pede o valor da compra
puts "Qual o valor da compra?"
valor_compra = gets.chomp.to_f

# Pede o valor pago
puts "Quanto voce pagou?"
valor_pago = gets.chomp.to_f

#Calcula o troco
troco = valor_pago - valor_compra

#Verifica se o valor pago é suficiente
if troco >= 0
  puts " "
  puts "Compra: #{valor_compra} "
  puts "pago: #{valor_pago}"
  puts "Troco: #{troco.round(2)}"
  puts " "
  puts "Obrigado pela compra!"
else
  falta = troco.abs  #.abs transforma negativo em positivo
  puts " "
  puts "ATENÇÃO! Falta R$ #{falta.round(2)} para completar o pagamento."
end

