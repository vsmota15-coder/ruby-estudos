# ========================================
#  TRATAMENTO DE ERROS
# ========================================

puts "="*60
puts "           TRATAMENTO DE ERROS EM RUBY"
puts "="*60

# ========================================   
# 1. O QUE SÃO EXCEÇÕES?
# ========================================

puts "\n1. O QUE SÃO EXCEÇÕES?"
puts "-"*60

puts "\nExceções são ERROS que acontecem durante a execução"
puts "Exemplos:"
puts "  • Dividir por zero"
puts "  • Abrir arquivo que não existe"
puts "  • Acessar índice inexistente em array"
puts "  • Conversão inválida de tipo"
puts "\nSem tratamento → programa PARA (crash)"
puts "Com tratamento → programa CONTINUA funcionando"

# ========================================
# 2. BEGIN / RESCUE / END
# ========================================

puts "\n" + "="*60
puts "2. BEGIN / RESCUE / END"
puts "-"*60

puts "\nSem tratamento de erro:"
begin
  # Este código vai dar erro
  # resultado = 10 / 0  # Descomente para ver o erro
  puts "Código executado com sucesso"
rescue
  puts " Aconteceu um erro!"
end

puts "\n"

# Exemplo prático
def dividir_seguro(a, b)
  begin
    resultado = a / b
    puts "#{a} ÷ #{b} = #{resultado}"
  rescue
    puts " Erro: Não é possível dividir por zero!"
  end
end

puts "Divisão segura:"
dividir_seguro(10, 2)
dividir_seguro(10, 0)  # Não quebra o programa!
dividir_seguro(20, 4)  # Continua funcionando

# ========================================
# 3. CAPTURANDO O ERRO
# ========================================

puts "\n" + "="*60
puts "3. CAPTURANDO INFORMAÇÕES DO ERRO"
puts "-"*60

def processar_numero(texto)
  begin
    numero = texto.to_i
    if texto != "0" && numero == 0
      raise "Não é um número válido"
    end
    puts "Número processado: #{numero}"
  rescue => erro
    puts " Erro capturado: #{erro.message}"
    puts "   Tipo do erro: #{erro.class}"
  end
end

puts "\nProcessando números:"
processar_numero("42")
processar_numero("abc")

# ========================================
# 4. TIPOS ESPECÍFICOS DE ERROS
# ========================================

puts "\n" + "="*60
puts "4. TIPOS ESPECÍFICOS DE ERROS"
puts "-"*60

def operacao_complexa(a, b, array)
  begin
    # Pode dar vários tipos de erro
    resultado = a / b
    elemento = array[10]
    arquivo = File.open("nao_existe.txt")
    
  rescue ZeroDivisionError
    puts " Erro: Divisão por zero!"
    
  rescue TypeError
    puts " Erro: Tipo de dado inválido!"
    
  rescue Errno::ENOENT
    puts " Erro: Arquivo não encontrado!"
    
  rescue => erro
    puts " Erro desconhecido: #{erro.message}"
  end
end

puts "\nTestando diferentes erros:"
operacao_complexa(10, 0, [1, 2, 3])

# ========================================
# 5. ENSURE - SEMPRE EXECUTA
# ========================================

puts "\n" + "="*60
puts "5. ENSURE - SEMPRE EXECUTA"
puts "-"*60

def abrir_conexao
  begin
    puts "1. Abrindo conexão..."
    # Simula uma operação que pode falhar
    resultado = rand(2)  # 0 ou 1
    
    if resultado == 0
      raise "Conexão falhou!"
    end
    
    puts "2. Operação realizada com sucesso!"
    
  rescue => erro
    puts " Erro: #{erro.message}"
    
  ensure
    puts "3. Fechando conexão... (sempre executa!)"
  end
end

puts "\nTestando ensure:"
abrir_conexao
puts ""
abrir_conexao

# ========================================
# 6. ELSE - SUCESSO
# ========================================

puts "\n" + "="*60
puts "6. ELSE - QUANDO NÃO HÁ ERRO"
puts "-"*60

def processar_dados(valor)
  begin
    puts "Processando #{valor}..."
    resultado = 100 / valor
    
  rescue ZeroDivisionError
    puts " Erro: Divisão por zero!"
    
  else
    puts " Sucesso! Resultado: #{resultado}"
    
  ensure
    puts "Processo finalizado.\n"
  end
end

puts "\nCom else:"
processar_dados(5)
processar_dados(0)

# ========================================
# 7. RESCUE INLINE
# ========================================

puts "\n" + "="*60
puts "7. RESCUE INLINE (UMA LINHA)"
puts "-"*60

# Forma tradicional
def idade_tradicional(texto)
  begin
    texto.to_i
  rescue
    0
  end
end

# Forma inline (mais curta)
def idade_inline(texto)
  texto.to_i rescue 0
end

puts "\nRescue inline:"
puts "Idade (abc): #{idade_inline('abc')}"
puts "Idade (25): #{idade_inline('25')}"

puts "\n"

# Outro exemplo
def pegar_primeiro_elemento(array)
  array[0] rescue "Array vazio ou inválido"
end

puts pegar_primeiro_elemento([1, 2, 3])
puts pegar_primeiro_elemento([])
puts pegar_primeiro_elemento(nil)

# ========================================
# 8. RAISE - LANÇAR EXCEÇÕES
# ========================================

puts "\n" + "="*60
puts "8. RAISE - LANÇAR EXCEÇÕES"
puts "-"*60

def sacar_dinheiro(saldo, valor)
  if valor <= 0
    raise "Valor deve ser positivo!"
  end
  
  if valor > saldo
    raise "Saldo insuficiente!"
  end
  
  saldo - valor
end

def testar_saque(saldo, valor)
  begin
    novo_saldo = sacar_dinheiro(saldo, valor)
    puts " Saque realizado! Novo saldo: R$ #{novo_saldo}"
  rescue => erro
    puts " Erro no saque: #{erro.message}"
  end
end

puts "\nTestando saques:"
testar_saque(1000, 500)
testar_saque(1000, 1500)
testar_saque(1000, -100)

# ========================================
# 9. CRIAR EXCEÇÕES CUSTOMIZADAS
# ========================================

puts "\n" + "="*60
puts "9.CRIAR EXCEÇÕES CUSTOMIZADAS"
puts "-"*60

# Definindo exceções personalizadas
class IdadeInvalidaError < StandardError
end

class EmailInvalidoError < StandardError
end

class SenhaFracaError < StandardError
end

def validar_usuario(idade, email, senha)
  # Validar idade
  if idade < 18
    raise IdadeInvalidaError, "Usuário deve ter 18 anos ou mais (tem #{idade})"
  end
  
  # Validar email
  unless email.include?("@")
    raise EmailInvalidoError, "Email deve conter @"
  end
  
  # Validar senha
  if senha.length < 6
    raise SenhaFracaError, "Senha deve ter pelo menos 6 caracteres"
  end
  
  " Usuário válido!"
end

def testar_validacao(idade, email, senha)
  begin
    resultado = validar_usuario(idade, email, senha)
    puts resultado
    
  rescue IdadeInvalidaError => erro
    puts " Erro de idade: #{erro.message}"
    
  rescue EmailInvalidoError => erro
    puts " Erro de email: #{erro.message}"
    
  rescue SenhaFracaError => erro
    puts " Erro de senha: #{erro.message}"
  end
end

puts "\nTestando validações customizadas:"
testar_validacao(25, "user@email.com", "senha123")
testar_validacao(15, "user@email.com", "senha123")
testar_validacao(25, "useremail.com", "senha123")
testar_validacao(25, "user@email.com", "abc")

# ========================================
# 10. RETRY - TENTAR NOVAMENTE
# ========================================

puts "\n" + "="*60
puts " RETRY - TENTAR NOVAMENTE"
puts "-"*60

def conectar_servidor(max_tentativas = 3)
  tentativas = 0
  
  begin
    tentativas += 1
    puts "Tentativa #{tentativas}: Conectando..."
    
    # Simula conexão (30% de chance de sucesso)
    sucesso = rand(10) < 3
    
    unless sucesso
      raise "Falha na conexão"
    end
    
    puts " Conectado com sucesso!"
    
  rescue => erro
    if tentativas < max_tentativas
      puts " #{erro.message}. Tentando novamente..."
      sleep(1)  # Espera 1 segundo
      retry  # Tenta de novo
    else
      puts " Falha após #{max_tentativas} tentativas"
    end
  end
end

puts "\nTestando retry:"
conectar_servidor

# ========================================
# 11. EXEMPLO COMPLETO: CALCULADORA SEGURA
# ========================================

puts "\n" + "="*60
puts "11. EXEMPLO: CALCULADORA SEGURA"
puts "-"*60

class OperacaoInvalidaError < StandardError
end

def calculadora_segura(num1, operacao, num2)
  begin
    # Validar números
    unless num1.is_a?(Numeric) && num2.is_a?(Numeric)
      raise TypeError, "Ambos os valores devem ser números"
    end
    
    # Realizar operação
    case operacao
    when "+"
      resultado = num1 + num2
    when "-"
      resultado = num1 - num2
    when "*"
      resultado = num1 * num2
    when "/"
      if num2 == 0
        raise ZeroDivisionError, "Não é possível dividir por zero"
      end
      resultado = num1.to_f / num2
    else
      raise OperacaoInvalidaError, "Operação '#{operacao}' não suportada"
    end
    
    puts " #{num1} #{operacao} #{num2} = #{resultado.round(2)}"
    
  rescue TypeError => erro
    puts " Erro de tipo: #{erro.message}"
    
  rescue ZeroDivisionError => erro
    puts " Erro matemático: #{erro.message}"
    
  rescue OperacaoInvalidaError => erro
    puts " Erro de operação: #{erro.message}"
    
  rescue => erro
    puts " Erro inesperado: #{erro.message}"
    
  ensure
    puts "─" * 50
  end
end

puts "\nTestando calculadora:"
calculadora_segura(10, "+", 5)
calculadora_segura(10, "/", 2)
calculadora_segura(10, "/", 0)
calculadora_segura(10, "%", 3)
calculadora_segura("abc", "+", 5)

# ========================================
# 12. EXERCÍCIO: SISTEMA DE LOGIN
# ========================================

puts "\n" + "="*60
puts " EXERCÍCIO: SISTEMA DE LOGIN COM ERROS"
puts "-"*60

class UsuarioNaoEncontradoError < StandardError
end

class SenhaIncorretaError < StandardError
end

class ContaBloqueadaError < StandardError
end

class SistemaLogin
  def initialize
    @usuarios = {
      "admin" => { senha: "admin123", bloqueado: false, tentativas: 0 },
      "user" => { senha: "user123", bloqueado: false, tentativas: 0 }
    }
  end
  
  def fazer_login(usuario, senha)
    begin
      # Verificar se usuário existe
      unless @usuarios.has_key?(usuario)
        raise UsuarioNaoEncontradoError, "Usuário '#{usuario}' não existe"
      end
      
      dados = @usuarios[usuario]
      
      # Verificar se conta está bloqueada
      if dados[:bloqueado]
        raise ContaBloqueadaError, "Conta bloqueada por excesso de tentativas"
      end
      
      # Verificar senha
      if dados[:senha] != senha
        dados[:tentativas] += 1
        
        if dados[:tentativas] >= 3
          dados[:bloqueado] = true
          raise ContaBloqueadaError, "Conta bloqueada após 3 tentativas incorretas"
        end
        
        raise SenhaIncorretaError, "Senha incorreta (tentativa #{dados[:tentativas]}/3)"
      end
      
      # Login bem-sucedido
      dados[:tentativas] = 0
      puts " Login realizado com sucesso! Bem-vindo, #{usuario}!"
      
    rescue UsuarioNaoEncontradoError => erro
      puts " #{erro.message}"
      
    rescue SenhaIncorretaError => erro
      puts " #{erro.message}"
      
    rescue ContaBloqueadaError => erro
      puts " #{erro.message}"
      
    ensure
      puts "─" * 50
    end
  end
end

puts "\nTestando sistema de login:"
sistema = SistemaLogin.new

sistema.fazer_login("admin", "admin123")
sistema.fazer_login("inexistente", "senha")
sistema.fazer_login("user", "errada")
sistema.fazer_login("user", "errada")
sistema.fazer_login("user", "errada")
sistema.fazer_login("user", "user123")

# ========================================
# RESUMO
# ========================================

puts "\n" + "="*60
puts " RESUMO - TRATAMENTO DE ERROS"
puts "="*60
puts "\n begin...rescue...end - Captura erros"
puts " rescue => e - Captura objeto do erro"
puts " rescue TipoErro - Captura erro específico"
puts " ensure - Sempre executa (limpar recursos)"
puts " else - Executa se NÃO houver erro"
puts " raise - Lança uma exceção"
puts " retry - Tenta executar novamente"
puts " rescue inline - valor rescue valor_padrao"
puts " class MeuErro < StandardError - Erro customizado"
puts " Sempre trate erros que podem acontecer!"
puts "="*60