#==============================
# HERANÇA EM RUBY
#==============================

puts "="*60
puts "                HERANÇA EM RUBY"
puts "="*60

# =================================
# 1 - O QUE É HERANÇA 
# =================================

puts  "\n1 - O QUE É HERANÇA " 
puts "-"*60

puts "\nHerança permite criar classes baseadas em outras"
puts "A classe 'filha' HERDA características da classe 'pai'"
puts "\nExemplo do mundo real:"
puts "   Animal (PAI)"
puts "     ├─  Cachorro (FILHO)"
puts "     ├─  Gato (FILHO)"
puts "     └─  Pássaro (FILHO)"
puts "\nTodos herdam de Animal: comer, dormir, respirar"
puts "Mas cada um tem comportamentos únicos!"

# ========================================
# 2. CRIAR HERANÇA SIMPLES
# ========================================

puts "\n" + "="*60
puts "2 - CRIAR HERANÇA SIMPLES"
puts "-"*60

# Classe pai (superclasse)
class Animal
  attr_accessor :nome, :idade
  
  def initialize(nome, idade)
    @nome = nome
    @idade = idade
  end
  
  def comer
    puts "#{@nome} está comendo..."
  end
  
  def dormir
    puts "#{@nome} está dormindo... "
  end
end

# Classe filha (subclasse) - herda de Animal
class Cachorro < Animal  # < significa "herda de"
  def latir
    puts "#{@nome} faz: Au au! "
  end
end

class Gato < Animal
  def miar
    puts "#{@nome} faz: Miau! "
  end
end

puts "\nUsando herança:"
rex = Cachorro.new("Rex", 3)
rex.comer    # Herdado de Animal
rex.dormir   # Herdado de Animal
rex.latir    # Próprio de Cachorro

puts ""
mimi = Gato.new("Mimi", 2)
mimi.comer   # Herdado de Animal
mimi.dormir  # Herdado de Animal
mimi.miar    # Próprio de Gato

# ========================================
# 3. SOBRESCRITA DE MÉTODOS (OVERRIDE)
# ========================================

puts "\n" + "="*60
puts "3 - SOBRESCRITA DE MÉTODOS"
puts "-"*60

class Veiculo
  attr_accessor :marca, :modelo
  
  def initialize(marca, modelo)
    @marca = marca
    @modelo = modelo
  end
  
  def acelerar
    puts "#{@modelo} está acelerando..."
  end
  
  def info
    puts "Veículo: #{@marca} #{@modelo}"
  end
end

class Carro < Veiculo
  attr_accessor :portas
  
  def initialize(marca, modelo, portas)
    super(marca, modelo)  # Chama initialize da classe pai
    @portas = portas
  end
  
  # Sobrescreve o método da classe pai
  def acelerar
    puts " #{@modelo} acelerando em alta velocidade!"
  end
  
  # Sobrescreve info
  def info
    super  # Chama o método da classe pai primeiro
    puts "Portas: #{@portas}"
  end
end

class Moto < Veiculo
  def initialize(marca, modelo)
    super(marca, modelo)
  end
  
  # Sobrescreve acelerar
  def acelerar
    puts "  #{@modelo} fazendo grau!"
  end
end

puts "\nTeste de sobrescrita:"
carro = Carro.new("Toyota", "Corolla", 4)
carro.acelerar  # Usa método sobrescrito
carro.info

puts ""
moto = Moto.new("Honda", "CB500")
moto.acelerar   # Usa método sobrescrito

# ========================================
# 4. PALAVRA-CHAVE SUPER
# ========================================

puts "\n" + "="*60
puts "4 - PALAVRA-CHAVE SUPER"
puts "-"*60

class Funcionario
  attr_accessor :nome, :salario
  
  def initialize(nome, salario)
    @nome = nome
    @salario = salario
  end
  
  def apresentar
    puts "Funcionário: #{@nome}"
    puts "Salário: R$ #{@salario}"
  end
  
  def calcular_bonus
    @salario * 0.10  # 10% de bônus
  end
end

class Gerente < Funcionario
  attr_accessor :departamento
  
  def initialize(nome, salario, departamento)
    super(nome, salario)  # Chama initialize do pai
    @departamento = departamento
  end
  
  def apresentar
    super  # Chama apresentar do pai
    puts "Departamento: #{@departamento}"
    puts "Cargo: Gerente"
  end
  
  def calcular_bonus
    super * 2  # Gerente ganha bônus dobrado (20%)
  end
end

class Diretor < Funcionario
  def initialize(nome, salario)
    super(nome, salario)
  end
  
  def calcular_bonus
    super * 3  # Diretor ganha bônus triplo (30%)
  end
end

puts "\nUsando super:"
funcionario = Funcionario.new("João", 3000)
funcionario.apresentar
puts "Bônus: R$ #{funcionario.calcular_bonus}"

puts "\n" + "-"*60
gerente = Gerente.new("Maria", 5000, "TI")
gerente.apresentar
puts "Bônus: R$ #{gerente.calcular_bonus}"

puts "\n" + "-"*60
diretor = Diretor.new("Carlos", 10000)
diretor.apresentar
puts "Bônus: R$ #{diretor.calcular_bonus}"

# ========================================
# 5. HERANÇA MULTINÍVEL
# ========================================

puts "\n" + "="*60
puts "5 - HERANÇA MULTINÍVEL"
puts "-"*60

class SerVivo
  def respirar
    puts "Respirando..."
  end
end

class Animal < SerVivo
  def se_mover
    puts "Se movendo..."
  end
end

class Mamifero < Animal
  def amamentar
    puts "Amamentando filhotes..."
  end
end

class Cachorro < Mamifero
  attr_accessor :nome
  
  def initialize(nome)
    @nome = nome
  end
  
  def latir
    puts "#{@nome}: Au au!"
  end
end

puts "\nHerança em cadeia:"
puts "SerVivo → Animal → Mamífero → Cachorro"
puts ""

dog = Cachorro.new("Bolt")
dog.respirar    # De SerVivo
dog.se_mover    # De Animal
dog.amamentar   # De Mamifero
dog.latir       # Próprio

# ========================================
# 6. VERIFICAR TIPO E HERANÇA
# ========================================

puts "\n" + "="*60
puts "6 - VERIFICAR TIPO E HERANÇA"
puts "-"*60

class Forma
end

class Retangulo < Forma
  attr_accessor :largura, :altura
  
  def initialize(largura, altura)
    @largura = largura
    @altura = altura
  end
  
  def area
    @largura * @altura
  end
end

class Quadrado < Retangulo
  def initialize(lado)
    super(lado, lado)  # Quadrado é retângulo com lados iguais
  end
end

retangulo = Retangulo.new(5, 3)
quadrado = Quadrado.new(4)

puts "\nVerificando tipos:"
puts "retangulo é Retangulo? #{retangulo.is_a?(Retangulo)}"
puts "retangulo é Forma? #{retangulo.is_a?(Forma)}"
puts "retangulo é Quadrado? #{retangulo.is_a?(Quadrado)}"

puts ""
puts "quadrado é Quadrado? #{quadrado.is_a?(Quadrado)}"
puts "quadrado é Retangulo? #{quadrado.is_a?(Retangulo)}"
puts "quadrado é Forma? #{quadrado.is_a?(Forma)}"

puts "\nVerificando classe exata:"
puts "Classe do retangulo: #{retangulo.class}"
puts "Classe do quadrado: #{quadrado.class}"

# ========================================
# 7. EXEMPLO COMPLETO: SISTEMA BANCÁRIO
# ========================================

puts "\n" + "="*60
puts "7 - EXEMPLO: SISTEMA BANCÁRIO"
puts "-"*60

class Conta
  attr_reader :numero, :titular, :saldo
  @@total_contas = 0
  
  def initialize(numero, titular, saldo_inicial = 0)
    @numero = numero
    @titular = titular
    @saldo = saldo_inicial
    @@total_contas += 1
  end
  
  def depositar(valor)
    if valor > 0
      @saldo += valor
      puts " Depósito de R$ #{valor} realizado!"
      return true
    else
      puts " Valor inválido!"
      return false
    end
  end
  
  def sacar(valor)
    if valor > @saldo
      puts " Saldo insuficiente!"
      return false
    elsif valor <= 0
      puts " Valor inválido!"
      return false
    else
      @saldo -= valor
      puts " Saque de R$ #{valor} realizado!"
      return true
    end
  end
  
  def extrato
    puts "\n" + "═"*40
    puts "EXTRATO - #{self.class}"
    puts "─"*40
    puts "Conta: #{@numero}"
    puts "Titular: #{@titular}"
    puts "Saldo: R$ #{@saldo.round(2)}"
    puts "═"*40
  end
  
  def self.total_contas
    @@total_contas
  end
end

class ContaCorrente < Conta
  attr_reader :limite
  
  def initialize(numero, titular, saldo_inicial, limite)
    super(numero, titular, saldo_inicial)
    @limite = limite
  end
  
  def sacar(valor)
    saldo_disponivel = @saldo + @limite
    
    if valor > saldo_disponivel
      puts " Saldo + limite insuficiente!"
      return false
    elsif valor <= 0
      puts " Valor inválido!"
      return false
    else
      @saldo -= valor
      puts " Saque de R$ #{valor} realizado!"
      return true
    end
  end
  
  def extrato
    super
    puts "Limite: R$ #{@limite}"
    puts "Disponível: R$ #{(@saldo + @limite).round(2)}"
    puts "═"*40
  end
end

class ContaPoupanca < Conta
  attr_reader :taxa_rendimento
  
  def initialize(numero, titular, saldo_inicial, taxa_rendimento = 0.005)
    super(numero, titular, saldo_inicial)
    @taxa_rendimento = taxa_rendimento
  end
  
  def render_juros
    juros = @saldo * @taxa_rendimento
    @saldo += juros
    puts " Rendimento de R$ #{juros.round(2)} aplicado!"
    puts "   Novo saldo: R$ #{@saldo.round(2)}"
  end
  
  def extrato
    super
    puts "Taxa de rendimento: #{(@taxa_rendimento * 100)}%"
    puts "═"*40
  end
end

puts "\nCriando contas:"
cc = ContaCorrente.new("001", "João Silva", 1000, 500)
cp = ContaPoupanca.new("002", "Maria Santos", 5000)

puts "\n--- CONTA CORRENTE ---"
cc.extrato
cc.depositar(500)
cc.sacar(1800)  # Usa o limite
cc.extrato

puts "\n--- CONTA POUPANÇA ---"
cp.extrato
cp.render_juros
cp.extrato

puts "\nTotal de contas criadas: #{Conta.total_contas}"

# ========================================
# 8. EXERCÍCIO: HIERARQUIA DE PRODUTOS
# ========================================

puts "\n" + "="*60
puts " EXERCÍCIO: HIERARQUIA DE PRODUTOS"
puts "-"*60

class Produto
  attr_accessor :nome, :preco
  attr_reader :codigo
  
  @@total_produtos = 0
  
  def initialize(codigo, nome, preco)
    @codigo = codigo
    @nome = nome
    @preco = preco
    @@total_produtos += 1
  end
  
  def info
    puts "\n╔════════════════════════════════╗"
    puts "║  #{self.class}"
    puts "╠════════════════════════════════╣"
    puts "║  Código: #{@codigo}"
    puts "║  Nome: #{@nome}"
    puts "║  Preço: R$ #{@preco}"
  end
  
  def preco_final
    @preco
  end
  
  def self.total_produtos
    @@total_produtos
  end
end

class Livro < Produto
  attr_accessor :autor, :editora
  
  def initialize(codigo, nome, preco, autor, editora)
    super(codigo, nome, preco)
    @autor = autor
    @editora = editora
  end
  
  def info
    super
    puts "║  Autor: #{@autor}"
    puts "║  Editora: #{@editora}"
    puts "╚════════════════════════════════╝"
  end
end

class Eletronico < Produto
  attr_accessor :garantia, :voltagem
  
  def initialize(codigo, nome, preco, garantia, voltagem)
    super(codigo, nome, preco)
    @garantia = garantia
    @voltagem = voltagem
  end
  
  def info
    super
    puts "║  Garantia: #{@garantia} meses"
    puts "║  Voltagem: #{@voltagem}V"
    puts "╚════════════════════════════════╝"
  end
  
  def preco_final
    # Eletrônicos têm taxa de garantia estendida
    @preco * 1.15  # +15% pela garantia
  end
end

class Alimento < Produto
  attr_accessor :validade, :tipo
  
  def initialize(codigo, nome, preco, validade, tipo)
    super(codigo, nome, preco)
    @validade = validade
    @tipo = tipo
  end
  
  def info
    super
    puts "║  Validade: #{@validade}"
    puts "║  Tipo: #{@tipo}"
    puts "╚════════════════════════════════╝"
  end
  
  def preco_final
    # Alimentos têm desconto de 10%
    @preco * 0.90
  end
end

puts "\nCriando produtos:"
livro = Livro.new("L001", "Clean Code", 89.90, "Robert Martin", "Alta Books")
notebook = Eletronico.new("E001", "Notebook Dell", 3500, 12, 110)
arroz = Alimento.new("A001", "Arroz 5kg", 25.00, "12/2025", "Grão")

livro.info
puts "Preço final: R$ #{livro.preco_final}"

notebook.info
puts "Preço final: R$ #{notebook.preco_final.round(2)}"

arroz.info
puts "Preço final: R$ #{arroz.preco_final.round(2)}"

puts "\nTotal de produtos: #{Produto.total_produtos}"

# ========================================
# RESUMO
# ========================================

puts "\n" + "="*60
puts " RESUMO - HERANÇA EM RUBY"
puts "="*60
puts "\n class Filho < Pai - Cria herança"
puts " Filho herda TODOS os métodos e atributos do Pai"
puts " super - Chama método da classe pai"
puts " super(args) - Passa argumentos para método pai"
puts " Sobrescrita - Filho pode modificar métodos do Pai"
puts " is_a?(Classe) - Verifica se objeto é de uma classe"
puts " .class - Retorna a classe exata do objeto"
puts " Herança evita repetição de código"
puts " Use herança quando houver relação 'É UM'"
puts "   Exemplo: Cachorro É UM Animal "
puts "="*60