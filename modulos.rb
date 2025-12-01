puts "="*60
puts "              MODULOS EM RUBY"
puts "="*60

puts "\n1 - O QUE SÃO MÓDULOS?"
puts "-"*60

puts "\nMódulos são coleções de métodos e constantes"
puts "Servem para 2 propósitos principais:"
puts "  1. NAMESPACE - Organizar código (evitar conflitos)"
puts "  2. MIXIN - Compartilhar funcionalidades entre classes"
puts "\nDiferença: Módulos NÃO podem ser instanciados"
puts "  • Classe: pode criar objetos (new)"
puts "  • Módulo: NÃO pode criar objetos"

puts "="*60
puts "2 -  MÓDULOS COMO NAMESPACE"
puts "-"*60

# Problema: Duas classes com mesmo nome
# class Animal
#   def falar
#     "Som do animal"
#   end
# end
# 
# class Animal  # CONFLITO! Sobrescreve a anterior
#   def falar
#     "Outro som"
#   end
# end

# Solução: Usar módulos como namespace

module Fazenda 
  class Animal
    def falar
      "Muuuuu(vaca da fazenda)"
    end
  end
end

module Zoologico
  class Animal 
    def falar
      "Roarrrrr(leão do zoológico)"
    end
  end
end

puts "\nUsando namespace: "
animal_fazenda = Fazenda::Animal.new
puts animal_fazenda.falar

animal_zoo = Zoologico::Animal.new
puts animal_zoo.falar

puts "\n"

# Módulo para organizar constantes
module Configuracao
  VERSAO = "1.0.0"
  MAX_USUARIOS = 100
  TIMEOUT = 30
  
  def self.info
    puts "Sistema versão #{VERSAO}"
    puts "Máximo de #{MAX_USUARIOS} usuários"
    puts "Timeout: #{TIMEOUT} segundos"
  end

  def self.validar
    puts "\nValidando configurações..."
    puts "Versão Ok"
    puts "Limite de usuários OK"
  end
end

puts "\nUsando módulo Configuracao:"
Configuracao.info
Configuracao.validar
puts "Acessando constante: #{Configuracao::VERSAO}"


# ========================================
# 3. MÓDULOS COMO MIXIN (include)
# ========================================

puts "\n" + "="*60
puts "3 - MÓDULOS COMO MIXIN (include)"
puts "-"*60

# Módulo com funcionalidades
module Nadador
  def nadar
    puts "#{self.class}: Estou nadando! "
  end
end

module Voador
  def voar
    puts "#{self.class}: Estou voando! "
  end
end

module Corredor
  def correr
    puts "#{self.class}: Estou correndo! "
  end
end

# Classes que incluem módulos
class Pato
  include Nadador
  include Voador
  include Corredor
end

class Peixe
  include Nadador
end

class Passaro
  include Voador
end

class Cachorro
  include Corredor
end

puts "\nTestando mixins:"
pato = Pato.new
pato.nadar
pato.voar
pato.correr

puts ""
peixe = Peixe.new
peixe.nadar
# peixe.voar  # ERRO! Peixe não tem esse módulo

puts ""
passaro = Passaro.new
passaro.voar

puts ""
cachorro = Cachorro.new
cachorro.correr

# ========================================
# 4. INCLUDE VS EXTEND VS PREPEND
# ========================================

puts "\n" + "="*60
puts "4 - INCLUDE VS EXTEND VS PREPEND"
puts "-"*60

module Saudacao
  def oi
    "Olá! "
  end
end

# INCLUDE - adiciona como método de INSTÂNCIA
class Pessoa
  include Saudacao
end

pessoa = Pessoa.new
puts "\nINCLUDE (método de instância):"
puts pessoa.oi  #  Funciona
# puts Pessoa.oi  #  ERRO! Não é método de classe

puts "\n"

# EXTEND - adiciona como método de CLASSE
class Empresa
  extend Saudacao
end

puts "EXTEND (método de classe):"
puts Empresa.oi  #  Funciona
# empresa = Empresa.new
# puts empresa.oi  #  ERRO! Não é método de instância

puts "\n"

# PREPEND - como include, mas com prioridade
module ModuloA
  def mensagem
    "Mensagem do Módulo A"
  end
end

class ClasseComInclude
  include ModuloA
  
  def mensagem
    "Mensagem da Classe"
  end
end

class ClasseComPrepend
  prepend ModuloA
  
  def mensagem
    "Mensagem da Classe"
  end
end

puts "INCLUDE (classe tem prioridade):"
obj1 = ClasseComInclude.new
puts obj1.mensagem  # Usa método da classe

puts "\nPREPEND (módulo tem prioridade):"
obj2 = ClasseComPrepend.new
puts obj2.mensagem  # Usa método do módulo

# ========================================
# 5. MÓDULOS COM MÉTODOS DE MÓDULO
# ========================================

puts "\n" + "="*60
puts "5 - MÓDULOS COM MÉTODOS DE MÓDULO"
puts "-"*60

module Matematica
  PI = 3.14159
  
  # Método de módulo (self.)
  def self.area_circulo(raio)
    PI * raio ** 2
  end
  
  def self.perimetro_circulo(raio)
    2 * PI * raio
  end
  
  def self.quadrado(numero)
    numero ** 2
  end
end

puts "\nUsando métodos de módulo:"
puts "Área do círculo (raio 5): #{Matematica.area_circulo(5)}"
puts "Perímetro do círculo (raio 5): #{Matematica.perimetro_circulo(5)}"
puts "Quadrado de 7: #{Matematica.quadrado(7)}"

# ========================================
# 6. MÓDULOS ANINHADOS
# ========================================

puts "\n" + "="*60
puts "6 - MÓDULOS ANINHADOS"
puts "-"*60

module Organizacao
  module RH
    class Funcionario
      attr_accessor :nome, :cargo
      
      def initialize(nome, cargo)
        @nome = nome
        @cargo = cargo
      end
      
      def info
        "#{@nome} - #{@cargo}"
      end
    end
  end
  
  module TI
    class Desenvolvedor
      attr_accessor :nome, :linguagem
      
      def initialize(nome, linguagem)
        @nome = nome
        @linguagem = linguagem
      end
      
      def info
        "#{@nome} - Dev #{@linguagem}"
      end
    end
  end
end

puts "\nUsando módulos aninhados:"
func = Organizacao::RH::Funcionario.new("Maria", "Gerente")
puts func.info

dev = Organizacao::TI::Desenvolvedor.new("João", "Ruby")
puts dev.info

# ========================================
# 7. EXEMPLO PRÁTICO: SISTEMA DE PAGAMENTOS
# ========================================

puts "\n" + "="*60
puts "7 - EXEMPLO: SISTEMA DE PAGAMENTOS"
puts "-"*60

module Pagavel
  def calcular_imposto(valor)
    valor * 0.15  # 15% de imposto
  end
  
  def calcular_desconto(valor, percentual)
    valor * (percentual / 100.0)
  end
  
  def valor_final(valor, desconto_percentual = 0)
    valor_com_desconto = valor - calcular_desconto(valor, desconto_percentual)
    valor_com_imposto = valor_com_desconto + calcular_imposto(valor_com_desconto)
    valor_com_imposto.round(2)
  end
end

module Validacoes
  def validar_valor(valor)
    if valor <= 0
      raise "Valor deve ser positivo!"
    end
    true
  end
  
  def validar_desconto(desconto)
    if desconto < 0 || desconto > 100
      raise "Desconto deve estar entre 0 e 100%"
    end
    true
  end
end

class Produto
  include Pagavel
  include Validacoes
  
  attr_accessor :nome, :preco
  
  def initialize(nome, preco)
    validar_valor(preco)
    @nome = nome
    @preco = preco
  end
  
  def exibir_resumo(desconto = 0)
    validar_desconto(desconto)
    
    puts "\n=====================================|"
    puts "|  RESUMO DA COMPRA"
    puts "|======================================|"
    puts "|  Produto: #{@nome}"
    puts "|  Preço base: R$ #{@preco}"
    
    if desconto > 0
      desc_valor = calcular_desconto(@preco, desconto)
      puts "|  Desconto (#{desconto}%): -R$ #{desc_valor.round(2)}"
    end
    
    imposto = calcular_imposto(@preco - calcular_desconto(@preco, desconto))
    puts "|  Imposto (15%): +R$ #{imposto.round(2)}"
    puts "|  "
    puts "|  TOTAL: R$ #{valor_final(@preco, desconto)}"
    puts "|===========================================|"
  end
end

puts "\nTestando sistema:"
notebook = Produto.new("Notebook Dell", 3000)
notebook.exibir_resumo(10)

# ========================================
# 8. EXERCÍCIO: MÓDULO DE AUTENTICAÇÃO
# ========================================

puts "\n" + "="*60
puts " EXERCÍCIO: MÓDULO DE AUTENTICAÇÃO"
puts "-"*60

module Autenticavel
  def fazer_login(senha_digitada)
    if senha_digitada == @senha
      @logado = true
      puts " Login realizado com sucesso!"
      return true
    else
      puts " Senha incorreta!"
      return false
    end
  end
  
  def fazer_logout
    @logado = false
    puts " Logout realizado!"
  end
  
  def logado?
    @logado
  end
end

module Permissoes
  def tem_permissao?(acao)
    return false unless logado?
    
    case @nivel
    when "admin"
      true
    when "editor"
      ["ler", "editar"].include?(acao)
    when "leitor"
      acao == "ler"
    else
      false
    end
  end
end

class Usuario
  include Autenticavel
  include Permissoes
  
  attr_accessor :nome, :email, :nivel
  
  def initialize(nome, email, senha, nivel)
    @nome = nome
    @email = email
    @senha = senha
    @nivel = nivel
    @logado = false
  end
  
  def executar_acao(acao)
    if !logado?
      puts " Você precisa fazer login primeiro!"
      return
    end
    
    if tem_permissao?(acao)
      puts " #{@nome} executou: #{acao}"
    else
      puts " #{@nome} não tem permissão para: #{acao}"
    end
  end
end

puts "\nTestando autenticação:"
admin = Usuario.new("Carlos", "carlos@email.com", "senha123", "admin")
editor = Usuario.new("Maria", "maria@email.com", "senha456", "editor")

admin.executar_acao("deletar")  # Precisa login
admin.fazer_login("senha123")
admin.executar_acao("deletar")  # Admin pode tudo

puts ""
editor.fazer_login("senha456")
editor.executar_acao("ler")     # Pode
editor.executar_acao("editar")  # Pode
editor.executar_acao("deletar") # Não pode

# ========================================
# RESUMO
# ========================================

puts "\n" + "="*60
puts " RESUMO - MÓDULOS"
puts "="*60
puts "\n module NomeModulo - Define um módulo"
puts " NAMESPACE - Organiza código (Modulo::Classe)"
puts " MIXIN - Compartilha funcionalidades"
puts " include - Adiciona métodos de INSTÂNCIA"
puts " extend - Adiciona métodos de CLASSE"
puts " prepend - Como include, mas com prioridade"
puts " Módulos NÃO podem ser instanciados"
puts " Use módulos para evitar repetição de código"
puts " Uma classe pode incluir vários módulos"
puts "="*60