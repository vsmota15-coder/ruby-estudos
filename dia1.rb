#puts "Ola mundo"
#tempo_restante = "6 semanas"
#puts "tenho #{tempo_restante} para fazer isso!"


#nome = "Vitor"
#ano_nascimento = "2005"
#ano_atual = "2025"

#idade_calculada = ano_atual.to_i - ano_nascimento.to_i

#puts "#{nome} nasceu em #{ano_nascimento} e tem #{idade_calculada} anos "

puts "Qual é o seu nome ?"
nome = gets.chomp 

puts "Qual é o seu ano de nascimento?"
ano_nascimento = gets.chomp.to_i

ano_atual = 2025

idade_calculada = ano_atual - ano_nascimento

puts "#{nome} nasceu em #{ano_nascimento} e tem #{idade_calculada} anos"

if idade_calculada >= 18
  puts "Você é maior de idade"
else
  puts "Voce é menor de idade"
end