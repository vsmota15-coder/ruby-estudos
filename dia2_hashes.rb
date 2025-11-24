# ========================================
# GUIA COMPLETO DE HASHES EM RUBY
# ========================================

# ========================================
# 1. O QUE SÃO HASHES?
# ========================================

puts "="*50
puts "O QUE SÃO HASHES?"
puts "="*50

puts "\nHash é uma coleção de pares CHAVE => VALOR"
puts "Pense como um dicionário:"
puts "  - CHAVE: a palavra que você procura"
puts "  - VALOR: a definição/significado"

puts "\nArray vs Hash:"
puts "Array:  ['João', 25, 'São Paulo']  ← Acessa por NÚMERO (índice)"
puts "Hash:   {'nome' => 'João', 'idade' => 25}  ← Acessa por NOME (chave)"

puts "\n" + "="*50 + "\n"

# ========================================
# 2. CRIAR HASHES
# ========================================

puts "CRIAR HASHES"
puts "="*50

# Forma 1: Hash vazio
pessoa = {}
puts "Hash vazio: #{pessoa}"

# Forma 2: Hash com dados (sintaxe antiga com =>)
carro = {
  "marca" => "Toyota",
  "modelo" => "Corolla",
  "ano" => 2020,
  "cor" => "Prata"
}
puts "\nCarro: #{carro}"

# Forma 3: Hash com símbolos (sintaxe moderna com :)
cachorro = {
  nome: "Rex",
  raca: "Labrador",
  idade: 3,
  cor: "Dourado"
}
puts "Cachorro: #{cachorro}"

# Forma 4: Usando Hash.new
frutas = Hash.new
puts "Hash novo: #{frutas}"

# Forma 5: Hash com tipos mistos
misturado = {
  "texto" => "Ruby",
  numero: 42,
  "ativo" => true,
  lista: [1, 2, 3]
}
puts "Misturado: #{misturado}"

puts "\n" + "="*50 + "\n"

# ========================================
# 3. ACESSAR VALORES POR CHAVE
# ========================================

puts "ACESSAR VALORES POR CHAVE"
puts "="*50

# Usando hash com strings como chaves
pessoa = {
  "nome" => "Maria",
  "idade" => 28,
  "cidade" => "Rio de Janeiro",
  "profissao" => "Engenheira"
}

puts "\nAcessando com colchetes []:"
puts "Nome: #{pessoa["nome"]}"
puts "Idade: #{pessoa["idade"]}"
puts "Cidade: #{pessoa["cidade"]}"

puts "\n"

# Usando hash com símbolos como chaves
produto = {
  nome: "Notebook",
  preco: 3500.00,
  estoque: 15,
  marca: "Dell"
}

puts "Acessando símbolos:"
puts "Produto: #{produto[:nome]}"
puts "Preço: R$ #{produto[:preco]}"
puts "Estoque: #{produto[:estoque]} unidades"

puts "\n"

# Tentando acessar chave que não existe
puts "Chave inexistente: #{pessoa["email"]}"  # Retorna nil
puts "Verificar se chave existe: #{pessoa.has_key?("nome")}"  # true
puts "Verificar chave inexistente: #{produto.has_key?(:desconto)}"  # false

puts "\n" + "="*50 + "\n"

# ========================================
# 4. ADICIONAR PARES CHAVE-VALOR
# ========================================

puts "ADICIONAR PARES CHAVE-VALOR"
puts "="*50

aluno = {
  nome: "Carlos",
  idade: 20
}

puts "Hash inicial: #{aluno}"

# Forma 1: Usando colchetes
aluno[:curso] = "Ciência da Computação"
aluno[:matricula] = 12345

puts "Depois de adicionar: #{aluno}"

puts "\n"

# Forma 2: Adicionando múltiplos de uma vez com .merge
novas_infos = { periodo: 4, media: 8.5 }
aluno = aluno.merge(novas_infos)

puts "Depois do merge: #{aluno}"

puts "\n"

# Adicionando a um hash com strings
livro = {
  "titulo" => "1984",
  "autor" => "George Orwell"
}

livro["ano"] = 1949
livro["paginas"] = 328

puts "Livro completo: #{livro}"

puts "\n" + "="*50 + "\n"

# ========================================
# 5. REMOVER PARES CHAVE-VALOR
# ========================================

puts "REMOVER PARES CHAVE-VALOR"
puts "="*50

usuario = {
  nome: "Ana",
  email: "ana@email.com",
  senha: "123456",
  idade: 25,
  ativo: true
}

puts "Hash original: #{usuario}"

# Forma 1: .delete (remove e retorna o valor)
senha_removida = usuario.delete(:senha)
puts "\nSenha removida: #{senha_removida}"
puts "Depois de remover senha: #{usuario}"

puts "\n"

# Forma 2: Remover múltiplas chaves
usuario.delete(:idade)
usuario.delete(:ativo)
puts "Depois de remover idade e ativo: #{usuario}"

puts "\n"

# Tentando remover chave inexistente
resultado = usuario.delete(:telefone)
puts "Tentou remover telefone: #{resultado}"  # Retorna nil

puts "\n" + "="*50 + "\n"

# ========================================
# 6. MÉTODOS ÚTEIS DE HASHES
# ========================================

puts "MÉTODOS ÚTEIS DE HASHES"
puts "="*50

dados = {
  nome: "Pedro",
  idade: 30,
  cidade: "Belo Horizonte"
}

# .keys (retorna array com todas as chaves)
puts "Chaves: #{dados.keys}"

# .values (retorna array com todos os valores)
puts "Valores: #{dados.values}"

# .length ou .size (quantidade de pares)
puts "Quantidade de pares: #{dados.length}"

# .empty? (verifica se está vazio)
puts "Está vazio? #{dados.empty?}"

# .has_key? ou .key? (verifica se tem a chave)
puts "Tem chave 'nome'? #{dados.has_key?(:nome)}"

# .has_value? ou .value? (verifica se tem o valor)
puts "Tem valor 30? #{dados.has_value?(30)}"

puts "\n"

# .each (percorrer o hash)
puts "Percorrendo com .each:"
dados.each do |chave, valor|
  puts "  #{chave}: #{valor}"
end

puts "\n"

# .each_key (só as chaves)
puts "Só as chaves:"
dados.each_key do |chave|
  puts "  - #{chave}"
end

puts "\n"

# .each_value (só os valores)
puts "Só os valores:"
dados.each_value do |valor|
  puts "  → #{valor}"
end

puts "\n" + "="*50 + "\n"

# ========================================
# 7. EXERCÍCIO: AGENDA DE CONTATOS SIMPLES
# ========================================

puts " AGENDA DE CONTATOS SIMPLES "
puts "="*50

# Hash para armazenar contatos
# Estrutura: { "nome" => {"telefone" => "...", "email" => "..."} }
agenda = {}

loop do
  puts "\n--- MENU DA AGENDA ---"
  puts "1. Adicionar contato"
  puts "2. Ver todos os contatos"
  puts "3. Buscar contato"
  puts "4. Remover contato"
  puts "5. Editar contato"
  puts "6. Quantidade de contatos"
  puts "0. Sair"
  print "Escolha uma opção: "
  
  opcao = gets.chomp.to_i
  
  case opcao
  when 1
    # Adicionar contato
    print "\nNome do contato: "
    nome = gets.chomp
    
    if agenda.has_key?(nome)
      puts " Contato já existe!"
    else
      print "Telefone: "
      telefone = gets.chomp
      
      print "Email: "
      email = gets.chomp
      
      agenda[nome] = {
        telefone: telefone,
        email: email
      }
      
      puts " Contato '#{nome}' adicionado com sucesso!"
    end
    
  when 2
    # Ver todos os contatos
    if agenda.empty?
      puts "\n Agenda vazia!"
    else
      puts "\n LISTA DE CONTATOS:"
      puts "-" * 50
      
      agenda.each do |nome, dados|
        puts "\n #{nome}"
        puts "     Telefone: #{dados[:telefone]}"
        puts "    Email: #{dados[:email]}"
      end
    end
    
  when 3
    # Buscar contato
    print "\nNome do contato: "
    nome = gets.chomp
    
    if agenda.has_key?(nome)
      puts "\n✓ Contato encontrado!"
      puts " Nome: #{nome}"
      puts "  Telefone: #{agenda[nome][:telefone]}"
      puts " Email: #{agenda[nome][:email]}"
    else
      puts "\n Contato não encontrado!"
    end
    
  when 4
    # Remover contato
    print "\nNome do contato para remover: "
    nome = gets.chomp
    
    if agenda.has_key?(nome)
      agenda.delete(nome)
      puts " Contato '#{nome}' removido!"
    else
      puts " Contato não encontrado!"
    end
    
  when 5
    # Editar contato
    print "\nNome do contato para editar: "
    nome = gets.chomp
    
    if agenda.has_key?(nome)
      puts "\nDados atuais:"
      puts "Telefone: #{agenda[nome][:telefone]}"
      puts "Email: #{agenda[nome][:email]}"
      
      print "\nNovo telefone (Enter para manter): "
      novo_tel = gets.chomp
      agenda[nome][:telefone] = novo_tel unless novo_tel.empty?
      
      print "Novo email (Enter para manter): "
      novo_email = gets.chomp
      agenda[nome][:email] = novo_email unless novo_email.empty?
      
      puts " Contato atualizado!"
    else
      puts " Contato não encontrado!"
    end
    
  when 6
    # Quantidade de contatos
    puts "\n Total de contatos: #{agenda.length}"
    
    if agenda.length > 0
      puts "\nNomes cadastrados:"
      agenda.keys.each_with_index do |nome, i|
        puts "  #{i + 1}. #{nome}"
      end
    end
    
  when 0
    # Sair
    puts "\n Saindo da agenda... Até logo!"
    break
    
  else
    puts "\n Opção inválida! Tente novamente."
  end
end

puts "\n" + "="*50
puts " Agenda finalizada!"
puts "="*50