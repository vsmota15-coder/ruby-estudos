#=====================================
# CLASSES EM RUBY 
#=====================================

puts "="*60
puts "                CLASSES EM RUBY"
puts "="*60

#=====================================
#1 - O QUE SÃO CLASSES 
#=====================================

puts "1 - O QUE SÃO CLASSES "
puts "-"*60

puts "\nClasse é um 'molde' para criar objetos"
puts "Pense como uma 'forma de bolo':"
puts "   Classe = Forma (molde)"
puts "   Objeto = Bolo (criado a partir da forma)"
puts "\nExemplos do mundo real:"
puts "  • Classe 'Carro' → objetos: fusca, civic, gol"
puts "  • Classe 'Pessoa' → objetos: joão, maria, carlos"
puts "  • Classe 'Animal' → objetos: rex, miau, piu"

# ========================================
# 2. CRIAR UMA CLASSE SIMPLES
# ========================================

puts "\n" + "="*60
puts "2 - CRIAR UMA CLASSE SIMPLES"
puts "-"*60

class Cachorro
  # Método especial que é executado ao criar objeto
  def initialize(nome, raca)
    @nome = nome  # @ = variável de instância
    @raca = raca
  end
  
  # Método da classe
  def latir
    puts "#{@nome} faz: Au au!"
  end
  
  def apresentar
    puts "Eu sou #{@nome}, um #{@raca}"
  end
end

# Criando objetos (instâncias) da classe
puts "\nCriando objetos:"
rex = Cachorro.new("Rex", "Labrador")
bob = Cachorro.new("Bob", "Poodle")

rex.latir
bob.latir
rex.apresentar
bob.apresentar

# ========================================
# 3. VARIÁVEIS DE INSTÂNCIA (@)
# ========================================

puts "\n" + "="*60
puts "3 - VARIÁVEIS DE INSTÂNCIA (@variavel)"
puts "-"*60

class Pessoa
  def initialize(nome, idade)
    @nome = nome    # Cada objeto tem seu próprio @nome
    @idade = idade  # Cada objeto tem sua própria @idade
  end
  
  def mostrar_dados
    puts "Nome: #{@nome}, Idade: #{@idade}"
  end
end

puts "\nCriando duas pessoas:"
pessoa1 = Pessoa.new("Maria", 25)
pessoa2 = Pessoa.new("João", 30)

pessoa1.mostrar_dados
pessoa2.mostrar_dados

# ========================================
# 4. GETTERS E SETTERS (ACESSORES)
# ========================================

puts "\n" + "="*60
puts "4 - GETTERS E SETTERS"
puts "-"*60

class ContaBancaria
  # Forma manual de criar getters e setters
  def initialize(titular, saldo)
    @titular = titular
    @saldo = saldo
  end
  
  # Getter (ler valor)
  def titular
    @titular
  end
  
  # Setter (modificar valor)
  def titular=(novo_titular)
    @titular = novo_titular
  end
  
  # Getter para saldo
  def saldo
    @saldo
  end
  
  def depositar(valor)
    @saldo += valor
    puts "Depósito de R$ #{valor} realizado!"
  end
  
  def sacar(valor)
    if valor > @saldo
      puts "Saldo insuficiente!"
    else
      @saldo -= valor
      puts "Saque de R$ #{valor} realizado!"
    end
  end
end

puts "\nUsando getters e setters:"
conta = ContaBancaria.new("Carlos", 1000)
puts "Titular: #{conta.titular}"
puts "Saldo: R$ #{conta.saldo}"

conta.depositar(500)
puts "Novo saldo: R$ #{conta.saldo}"

conta.sacar(300)
puts "Saldo final: R$ #{conta.saldo}"

# ========================================
# 5. ATTR_ACCESSOR (ATALHO)
# ========================================

puts "\n" + "="*60
puts "5 - ATTR_ACCESSOR, ATTR_READER, ATTR_WRITER"
puts "-"*60

class Produto
  # attr_accessor cria getter E setter automaticamente
  attr_accessor :nome, :preco
  
  # attr_reader cria APENAS getter (só leitura)
  attr_reader :codigo
  
  # attr_writer cria APENAS setter (só escrita)
  attr_writer :descricao
  
  def initialize(nome, preco, codigo)
    @nome = nome
    @preco = preco
    @codigo = codigo
    @descricao = ""
  end
  
  def exibir
    puts "\n#{@codigo} - #{@nome}"
    puts "Preço: R$ #{@preco}"
    puts "Descrição: #{@descricao}"
  end
end

puts "\nUsando attr_accessor:"
produto = Produto.new("Notebook", 3500, "NB001")

# attr_accessor permite ler E modificar
puts "Nome: #{produto.nome}"
produto.nome = "Notebook Dell"
puts "Nome alterado: #{produto.nome}"

# attr_reader permite APENAS ler
puts "Código: #{produto.codigo}"
# produto.codigo = "NB002"  # ERRO! Não pode modificar

# attr_writer permite APENAS modificar
produto.descricao = "Notebook potente para programação"
# puts produto.descricao  # ERRO! Não pode ler diretamente

produto.exibir

# ========================================
# 6. MÉTODOS DE CLASSE (self.)
# ========================================

puts "\n" + "="*60
puts "6 - MÉTODOS DE CLASSE (self.)"
puts "-"*60

class Calculadora
  # Método de classe (chamado na classe, não no objeto)
  def self.somar(a, b)
    a + b
  end
  
  def self.subtrair(a, b)
    a - b
  end
  
  def self.multiplicar(a, b)
    a * b
  end
  
  def self.dividir(a, b)
    return "Erro: divisão por zero" if b == 0
    (a.to_f / b).round(2)
  end
end

puts "\nUsando métodos de classe:"
# Não precisa criar objeto! Chama direto na classe
puts "5 + 3 = #{Calculadora.somar(5, 3)}"
puts "10 - 4 = #{Calculadora.subtrair(10, 4)}"
puts "6 * 7 = #{Calculadora.multiplicar(6, 7)}"
puts "15 / 3 = #{Calculadora.dividir(15, 3)}"

# ========================================
# 7. VARIÁVEIS DE CLASSE (@@)
# ========================================

puts "\n" + "="*60
puts "7 - VARIÁVEIS DE CLASSE (@@variavel)"
puts "-"*60

class Usuario
  # Variável de classe (compartilhada por TODOS os objetos)
  @@total_usuarios = 0
  
  attr_accessor :nome, :email
  
  def initialize(nome, email)
    @nome = nome
    @email = email
    @@total_usuarios += 1  # Incrementa o contador
  end
  
  def self.total
    @@total_usuarios
  end
end

puts "\nCriando usuários:"
puts "Total inicial: #{Usuario.total}"

user1 = Usuario.new("Ana", "ana@email.com")
puts "Depois de criar Ana: #{Usuario.total}"

user2 = Usuario.new("Bruno", "bruno@email.com")
puts "Depois de criar Bruno: #{Usuario.total}"

user3 = Usuario.new("Carla", "carla@email.com")
puts "Depois de criar Carla: #{Usuario.total}"

# ========================================
# 8. CONSTANTES
# ========================================

puts "\n" + "="*60
puts "8 - CONSTANTES"
puts "-"*60

class Configuracao
  # Constantes (MAIÚSCULAS, não mudam)  
  VERSAO = "1.0.0"
  MAX_TENTATIVAS = 3
  TAXA_JUROS = 0.05
  
  def self.info
    puts "Sistema versão #{VERSAO}"
    puts "Máximo de tentativas: #{MAX_TENTATIVAS}"
    puts "Taxa de juros: #{TAXA_JUROS * 100}%"
  end
end

puts "\nAcessando constantes:"
Configuracao.info
puts "Versão: #{Configuracao::VERSAO}"

# ========================================
# 9. EXEMPLO COMPLETO: CLASSE LIVRO
# ========================================

puts "\n" + "="*60
puts "9 - EXEMPLO COMPLETO: CLASSE LIVRO"
puts "-"*60

class Livro
  attr_accessor :titulo, :autor, :paginas
  attr_reader :isbn
  
  @@total_livros = 0
  
  def initialize(titulo, autor, paginas, isbn)
    @titulo = titulo
    @autor = autor
    @paginas = paginas
    @isbn = isbn
    @lido = false
    @@total_livros += 1
  end
  
  def marcar_como_lido
    @lido = true
    puts " '#{@titulo}' marcado como lido!"
  end
  
  def esta_lido?
    @lido
  end
  
  def info_completa
    puts "\n" + "─"*50
    puts " #{@titulo}"
    puts "  Autor: #{@autor}"
    puts " Páginas: #{@paginas}"
    puts " ISBN: #{@isbn}"
    puts " Lido: #{@lido ? 'Sim' : 'Não'}"
    puts "─"*50
  end
  
  def self.total_livros
    @@total_livros
  end
end

puts "\nCriando biblioteca:"
livro1 = Livro.new("1984", "George Orwell", 328, "978-0451524935")
livro2 = Livro.new("O Hobbit", "J.R.R. Tolkien", 310, "978-0547928227")

livro1.info_completa
livro1.marcar_como_lido
livro1.info_completa

puts "\nTotal de livros cadastrados: #{Livro.total_livros}"

# ========================================
# 10. EXERCÍCIO: CLASSE CARRO
# =======================================

puts "\n" + "="*60
puts " EXERCÍCIO: CLASSE CARRO"
puts "-"*60

class Carro
  attr_accessor :marca, :modelo, :cor
  attr_reader :velocidade, :ligado
  
  VELOCIDADE_MAXIMA = 200
  
  def initialize(marca, modelo, cor)
    @marca = marca
    @modelo = modelo
    @cor = cor
    @velocidade = 0
    @ligado = false
  end
  
  def ligar
    if @ligado
      puts " #{@modelo} já está ligado!"
    else
      @ligado = true
      puts " #{@modelo} ligado!"
    end
  end
  
  def desligar
    if @velocidade > 0
      puts " Pare o carro antes de desligar!"
    else
      @ligado = false
      puts " #{@modelo} desligado!"
    end
  end
  
  def acelerar(incremento)
    if !@ligado
      puts " Ligue o carro primeiro!"
      return
    end
    
    nova_velocidade = @velocidade + incremento
    
    if nova_velocidade > VELOCIDADE_MAXIMA
      @velocidade = VELOCIDADE_MAXIMA
      puts " Velocidade máxima atingida: #{VELOCIDADE_MAXIMA} km/h"
    else
      @velocidade = nova_velocidade
      puts "  Acelerando... Velocidade: #{@velocidade} km/h"
    end
  end
  
  def frear(decremento)
    @velocidade -= decremento
    @velocidade = 0 if @velocidade < 0
    puts " Freando... Velocidade: #{@velocidade} km/h"
  end
  
  def status
    puts "\n----------------------------------"
    puts "|   STATUS DO CARRO"
    puts "|-----------------------------------"
    puts "|  Marca: #{@marca}"
    puts "|  Modelo: #{@modelo}"
    puts "|  Cor: #{@cor}"
    puts "|  Ligado: #{@ligado ? 'Sim ' : 'Não '}"
    puts "|  Velocidade: #{@velocidade} km/h"
    puts "-------------------------------------"
  end
end

puts "\nTestando classe Carro:"
meu_carro = Carro.new("Toyota", "Corolla", "Prata")

meu_carro.status
meu_carro.acelerar(50)  # Tenta acelerar desligado
meu_carro.ligar
meu_carro.acelerar(50)
meu_carro.acelerar(80)
meu_carro.acelerar(100)  # Vai atingir máxima
meu_carro.status
meu_carro.frear(50)
meu_carro.frear(150)  # Vai parar completamente
meu_carro.status
meu_carro.desligar

# ========================================
# RESUMO
# ========================================

puts "\n" + "="*60
puts " RESUMO - CLASSES EM RUBY"
puts "="*60
puts "\n class NomeClasse - Define uma classe"
puts " def initialize - Construtor da classe"
puts " @variavel - Variável de instância (cada objeto tem a sua)"
puts " @@variavel - Variável de classe (compartilhada)"
puts " attr_accessor - Cria getter e setter"
puts " attr_reader - Cria apenas getter"
puts " attr_writer - Cria apenas setter"
puts " self.metodo - Método de classe"
puts " CONSTANTE - Valor que não muda"
puts "="*60
