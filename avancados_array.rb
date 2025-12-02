# ========================================
#  MÉTODOS AVANÇADOS DE ARRAY
# ========================================



puts "="*60
puts "       MÉTODOS AVANÇADOS DE ARRAY EM RUBY"
puts "="*60

# ========================================
# 1. MAP / COLLECT - TRANSFORMAR ELEMENTOS
# ========================================

puts "\n1. MAP / COLLECT - TRANSFORMAR ELEMENTOS"
puts "-"*60

puts "\nmap cria um NOVO array transformando cada elemento"

numeros = [1, 2, 3, 4, 5]
puts "Original: #{numeros}"

# Dobrar cada número
dobrados = numeros.map { |n| n * 2 }
puts "Dobrados: #{dobrados}"

# Elevar ao quadrado
quadrados = numeros.map { |n| n ** 2 }
puts "Quadrados: #{quadrados}"

puts "\n"

# Com array de strings
nomes = ["ana", "bruno", "carla"]
puts "Nomes: #{nomes}"

# Deixar maiúsculas
maiusculas = nomes.map { |nome| nome.upcase }
puts "Maiúsculas: #{maiusculas}"

# Primeira letra maiúscula
capitalizados = nomes.map { |nome| nome.capitalize }
puts "Capitalizados: #{capitalizados}"

puts "\n"

# Com array de hashes
usuarios = [
  { nome: "João", idade: 25 },
  { nome: "Maria", idade: 30 },
  { nome: "Pedro", idade: 22 }
]

# Extrair apenas os nomes
somente_nomes = usuarios.map { |user| user[:nome] }
puts "Nomes dos usuários: #{somente_nomes}"

# Adicionar 10 anos
idades_futuro = usuarios.map { |user| user[:idade] + 10 }
puts "Idades daqui 10 anos: #{idades_futuro}"

# ========================================
# 2. SELECT / REJECT / FILTER - FILTRAR
# ========================================

puts "\n" + "="*60
puts "2. SELECT / REJECT / FILTER"
puts "-"*60

numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Números: #{numeros}"

# SELECT - mantém elementos que retornam true
pares = numeros.select { |n| n % 2 == 0 }
puts "Pares (select): #{pares}"

maiores_que_5 = numeros.select { |n| n > 5 }
puts "Maiores que 5: #{maiores_que_5}"

puts "\n"

# REJECT - remove elementos que retornam true (oposto do select)
impares = numeros.reject { |n| n % 2 == 0 }
puts "Ímpares (reject): #{impares}"

menores_ou_iguais_5 = numeros.reject { |n| n > 5 }
puts "Menores ou iguais a 5: #{menores_ou_iguais_5}"

puts "\n"

# Com array de hashes
produtos = [
  { nome: "Notebook", preco: 3000 },
  { nome: "Mouse", preco: 50 },
  { nome: "Teclado", preco: 200 },
  { nome: "Monitor", preco: 1000 },
  { nome: "Webcam", preco: 300 }
]

# Produtos caros (acima de 500)
caros = produtos.select { |p| p[:preco] > 500 }
puts "Produtos caros:"
caros.each { |p| puts "  - #{p[:nome]}: R$ #{p[:preco]}" }

puts ""

# Produtos baratos (até 200)
baratos = produtos.select { |p| p[:preco] <= 200 }
puts "Produtos baratos:"
baratos.each { |p| puts "  - #{p[:nome]}: R$ #{p[:preco]}" }

# ========================================
# 3. REDUCE / INJECT - ACUMULAR
# ========================================

puts "\n" + "="*60
puts "3. REDUCE / INJECT - ACUMULAR"
puts "-"*60

numeros = [1, 2, 3, 4, 5]
puts "Números: #{numeros}"

# Somar todos os números
soma = numeros.reduce(0) { |acumulador, n| acumulador + n }
puts "Soma: #{soma}"

puts "\n"

# Multiplicar todos
produto = numeros.reduce(1) { |acum, n| acum * n }
puts "Produto: #{produto}"

# Forma curta com símbolos
soma_curta = numeros.reduce(:+)
puts "Soma (forma curta): #{soma_curta}"

produto_curto = numeros.reduce(:*)
puts "Produto (forma curta): #{produto_curto}"

puts "\n"

# Exemplo prático: calcular total de compras
compras = [
  { item: "Pão", valor: 5.00 },
  { item: "Leite", valor: 4.50 },
  { item: "Café", valor: 12.00 },
  { item: "Açúcar", valor: 3.50 }
]

total = compras.reduce(0) { |soma, compra| soma + compra[:valor] }
puts "Compras:"
compras.each { |c| puts "  - #{c[:item]}: R$ #{c[:valor]}" }
puts "Total: R$ #{total}"

# ========================================
# 4. SORT / SORT_BY - ORDENAR
# ========================================

puts "\n" + "="*60
puts "4. SORT / SORT_BY - ORDENAR"
puts "-"*60

numeros = [5, 2, 8, 1, 9, 3]
puts "Desordenado: #{numeros}"

# SORT - ordem crescente
ordenado = numeros.sort
puts "Ordenado: #{ordenado}"

# Ordem decrescente
decrescente = numeros.sort.reverse
puts "Decrescente: #{decrescente}"

puts "\n"

# Com strings
palavras = ["zebra", "abacaxi", "maçã", "banana"]
puts "Palavras: #{palavras}"
ordenadas = palavras.sort
puts "Alfabética: #{ordenadas}"

puts "\n"

# SORT_BY - ordenar por critério específico
usuarios = [
  { nome: "Carlos", idade: 30 },
  { nome: "Ana", idade: 25 },
  { nome: "Bruno", idade: 35 }
]

# Ordenar por idade
por_idade = usuarios.sort_by { |user| user[:idade] }
puts "Ordenado por idade:"
por_idade.each { |u| puts "  #{u[:nome]}: #{u[:idade]} anos" }

puts ""

# Ordenar por nome
por_nome = usuarios.sort_by { |user| user[:nome] }
puts "Ordenado por nome:"
por_nome.each { |u| puts "  #{u[:nome]}: #{u[:idade]} anos" }

# ========================================
# 5. ANY? / ALL? / NONE? - VERIFICAR
# ========================================

puts "\n" + "="*60
puts "5. ANY? / ALL? / NONE? - VERIFICAR"
puts "-"*60

numeros = [2, 4, 6, 8, 10]
puts "Números: #{numeros}"

# ANY? - Algum elemento atende a condição?
tem_par = numeros.any? { |n| n % 2 == 0 }
puts "Tem algum par? #{tem_par}"

tem_maior_que_5 = numeros.any? { |n| n > 5 }
puts "Tem algum > 5? #{tem_maior_que_5}"

puts "\n"

# ALL? - TODOS atendem a condição?
todos_pares = numeros.all? { |n| n % 2 == 0 }
puts "Todos são pares? #{todos_pares}"

todos_positivos = numeros.all? { |n| n > 0 }
puts "Todos positivos? #{todos_positivos}"

puts "\n"

# NONE? - NENHUM atende a condição?
nenhum_negativo = numeros.none? { |n| n < 0 }
puts "Nenhum negativo? #{nenhum_negativo}"

nenhum_impar = numeros.none? { |n| n % 2 != 0 }
puts "Nenhum ímpar? #{nenhum_impar}"

puts "\n"

# Exemplo prático
usuarios = [
  { nome: "Ana", idade: 25, ativo: true },
  { nome: "Bruno", idade: 17, ativo: true },
  { nome: "Carla", idade: 30, ativo: false }
]

tem_menor = usuarios.any? { |u| u[:idade] < 18 }
puts "Tem usuário menor de idade? #{tem_menor}"

todos_ativos = usuarios.all? { |u| u[:ativo] }
puts "Todos os usuários estão ativos? #{todos_ativos}"

nenhum_bloqueado = usuarios.none? { |u| u[:ativo] == false }
puts "Nenhum usuário está bloqueado? #{nenhum_bloqueado}"

# ========================================
# 6. FLATTEN / COMPACT / UNIQ
# ========================================

puts "\n" + "="*60
puts "6. FLATTEN / COMPACT / UNIQ"
puts "-"*60

# FLATTEN - Achatar arrays aninhados
aninhado = [1, [2, 3], [4, [5, 6]]]
puts "Aninhado: #{aninhado}"
achatado = aninhado.flatten
puts "Flatten: #{achatado}"

puts "\n"

# COMPACT - Remove valores nil
com_nil = [1, nil, 2, nil, 3, 4, nil]
puts "Com nil: #{com_nil}"
sem_nil = com_nil.compact
puts "Compact: #{sem_nil}"

puts "\n"

# UNIQ - Remove duplicatas
duplicados = [1, 2, 2, 3, 3, 3, 4, 5, 5]
puts "Duplicados: #{duplicados}"
unicos = duplicados.uniq
puts "Uniq: #{unicos}"

puts "\n"

# Combinando métodos
bagunca = [1, nil, 2, 2, [3, 4], nil, [5, [6, 6]]]
puts "Bagunçado: #{bagunca}"
limpo = bagunca.flatten.compact.uniq.sort
puts "Limpo: #{limpo}"

# ========================================
# 7. FIND / DETECT - ENCONTRAR
# ========================================

puts "\n" + "="*60
puts "7. FIND / DETECT - ENCONTRAR PRIMEIRO"
puts "-"*60

numeros = [1, 2, 3, 4, 5, 6, 7, 8]

# Encontra o PRIMEIRO que atende
primeiro_par = numeros.find { |n| n % 2 == 0 }
puts "Primeiro par: #{primeiro_par}"

primeiro_maior_que_5 = numeros.find { |n| n > 5 }
puts "Primeiro > 5: #{primeiro_maior_que_5}"

puts "\n"

usuarios = [
  { nome: "Ana", idade: 25 },
  { nome: "Bruno", idade: 30 },
  { nome: "Carla", idade: 22 }
]

# Encontrar usuário específico
usuario = usuarios.find { |u| u[:nome] == "Bruno" }
puts "Usuário encontrado: #{usuario}"

maior_de_25 = usuarios.find { |u| u[:idade] > 25 }
puts "Primeiro com + de 25 anos: #{maior_de_25}"

# ========================================
# 8. COMBINANDO MÉTODOS (CHAINING)
# ========================================

puts "\n" + "="*60
puts "8. COMBINANDO MÉTODOS (METHOD CHAINING)"
puts "-"*60

numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Pegar números pares, dobrar e somar
resultado = numeros
  .select { |n| n % 2 == 0 }
  .map { |n| n * 2 }
  .reduce(:+)

puts "Números: #{numeros}"
puts "Resultado final: #{resultado}"

puts "\n"

# Exemplo mais complexo
produtos = [
  { nome: "Notebook", preco: 3000, categoria: "eletrônicos" },
  { nome: "Mouse", preco: 50, categoria: "eletrônicos" },
  { nome: "Cadeira", preco: 500, categoria: "móveis" },
  { nome: "Mesa", preco: 800, categoria: "móveis" },
  { nome: "Teclado", preco: 200, categoria: "eletrônicos" }
]

# Pegar eletrônicos, com preço > 100, ordenar por preço
eletronicos_caros = produtos
  .select { |p| p[:categoria] == "eletrônicos" }
  .select { |p| p[:preco] > 100 }
  .sort_by { |p| p[:preco] }

puts "Eletrônicos caros (ordenados por preço):"
eletronicos_caros.each { |p| puts "  #{p[:nome]}: R$ #{p[:preco]}" }

# ========================================
# 9. EXERCÍCIO FINAL
# ========================================

puts "\n" + "="*60
puts " EXERCÍCIO FINAL: ANÁLISE DE ALUNOS"
puts "-"*60

alunos = [
  { nome: "Ana", notas: [8, 9, 7, 8], faltas: 2 },
  { nome: "Bruno", notas: [6, 5, 7, 6], faltas: 5 },
  { nome: "Carla", notas: [9, 10, 9, 10], faltas: 0 },
  { nome: "Daniel", notas: [4, 5, 3, 4], faltas: 8 },
  { nome: "Eva", notas: [7, 8, 7, 9], faltas: 3 }
]

puts "\n ANÁLISE DA TURMA\n"
puts "─" * 60

# Calcular média de cada aluno
alunos_com_media = alunos.map do |aluno|
  media = aluno[:notas].reduce(:+).to_f / aluno[:notas].length
  aluno.merge(media: media.round(2))
end

# Mostrar todos com média
puts "\nAlunos e suas médias:"
alunos_com_media.each do |aluno|
  puts "  #{aluno[:nome]}: #{aluno[:media]}"
end

puts "\n"

# Aprovados (média >= 7 e faltas < 5)
aprovados = alunos_com_media.select do |aluno|
  aluno[:media] >= 7 && aluno[:faltas] < 5
end

puts "Aprovados: #{aprovados.map { |a| a[:nome] }.join(', ')}"

puts "\n"

# Reprovados
reprovados = alunos_com_media.reject do |aluno|
  aluno[:media] >= 7 && aluno[:faltas] < 5
end

puts "Reprovados: #{reprovados.map { |a| a[:nome] }.join(', ')}"

puts "\n"

# Melhor aluno
melhor = alunos_com_media.max_by { |a| a[:media] }
puts "Melhor aluno: #{melhor[:nome]} (média #{melhor[:media]})"

# Média da turma
media_turma = alunos_com_media.map { |a| a[:media] }.reduce(:+) / alunos_com_media.length
puts "Média da turma: #{media_turma.round(2)}"

# ========================================
# RESUMO
# ========================================

puts "\n" + "="*60
puts " RESUMO - MÉTODOS AVANÇADOS"
puts "="*60
puts "\n .map - Transforma cada elemento"
puts " .select - Filtra (mantém que retornam true)"
puts " .reject - Filtra (remove que retornam true)"
puts " .reduce - Acumula valores"
puts " .sort / .sort_by - Ordena elementos"
puts " .any? - Verifica se algum atende"
puts " .all? - Verifica se todos atendem"
puts " .none? - Verifica se nenhum atende"
puts " .flatten - Achata arrays aninhados"
puts " .compact - Remove nil"
puts " .uniq - Remove duplicatas"
puts " .find - Encontra primeiro elemento"
puts " Pode encadear métodos (chaining)!"
puts "="*60