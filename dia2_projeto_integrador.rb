#========================================
# SISTEMA DE CADASTRO DE ALUNOS COM NOTAS
#========================================

puts "="*60
puts "            SISTEMA DE GERENCIAMENTO ESCOLAR "
puts "="*60
puts "\n"

#==================================
# Variáveis globais 
#==================================

# Array que vai guardar todos os alunos 
# Cada aluno é um HASH com : nome , idade , curso e notas

alunos = []

# Variáveis de controle
total_cadastros = 0
sistema_ativo = true 

#=================================
# Funções auxiliares 
#=================================

# Função para calcular média 
def calcular_media(notas)
  return 0 if notas.empty?
  soma = 0 
  notas.each do |nota|
    soma += nota
  end
  media = soma.to_f / notas.length
   return media.round(2)  # Arredonda para 2 casas decimais
end

# Função para determinar situação
def verificar_situacao(media)
  if media >= 7.0
    return " Aprovado"
  elsif media >= 5.0
    return "  Recuperação"
  else
    return " Reprovado"
  end
end

# Função para exibir linha separadora
def linha(tamanho = 60)
  puts "-" * tamanho
end

#===========================
# Menu Principal
#===========================

loop do
  puts "\n"
  puts "="*60
  puts "                      MENU PRINCIPAL"
  puts "="*60
  puts "1.  Cadastrar novo aluno"
  puts "2.  Listar todos os alunos"
  puts "3.  Buscar aluno por nome"
  puts "4.  Adicionar nota a um aluno"
  puts "5.  Ver relatório completo de um aluno"
  puts "6.  Ver ranking (melhores médias)"
  puts "7.  Estatísticas gerais"
  puts "8.   Editar dados do aluno"
  puts "9.   Remover aluno"
  puts "0.  Sair do sistema"
  linha
  print "Escolha uma opção: "

  opcao = gets.chomp.to_i

  case opcao

  #===============================
  # Opção 1 = CADASTRAR NOVO ALUNO 
  #===============================

  when 1 
        puts "\n"
    puts "="*60
    puts "               CADASTRO DE NOVO ALUNO"
    puts "="*60

    print "\nNome do aluno: "
    nome = gets.chomp

    # Verificar se aluno já existe
    aluno_existe = false
    alunos.each do |aluno|
      if aluno[:nome].downcase == nome.downcase
        aluno_existe = true
        break
      end
    end

    if aluno_existe
      puts "\n ERRO: Aluno já cadastrado!"
    else
      print "Idade: "
      idade = gets.chomp.to_i
      
      print "Curso: "
      curso = gets.chomp

      # Criar hash do aluno
      novo_aluno = {
        nome: nome,
        idade: idade,
        curso: curso,
        notas: []  # Array vazio de notas
      }
      
      # Adicionar ao array de alunos
      alunos.push(novo_aluno)
      total_cadastros += 1
      
      puts "\n Aluno '#{nome}' cadastrado com sucesso!"
      puts " Total de alunos: #{alunos.length}"
    end

  # ========================================
  # OPÇÃO 2: LISTAR TODOS OS ALUNOS
  # ========================================
  when 2
    puts "\n"
    puts "="*60
    puts "               LISTA DE TODOS OS ALUNOS"
    puts "="*60
    
    if alunos.empty?
      puts "\n Nenhum aluno cadastrado!"
    else
      puts "\nTotal de alunos: #{alunos.length}\n"
      linha
      
      alunos.each_with_index do |aluno, indice|
        media = calcular_media(aluno[:notas])
        situacao = verificar_situacao(media)
        
        puts "\n#{indice + 1}. 👤 #{aluno[:nome]}"
        puts "    Idade: #{aluno[:idade]} anos"
        puts "    Curso: #{aluno[:curso]}"
        puts "    Notas: #{aluno[:notas].empty? ? 'Sem notas' : aluno[:notas]}"
        puts "    Média: #{media}"
        puts "   #{situacao}"
        linha
      end
    end
  
  # ========================================
  # OPÇÃO 3: BUSCAR ALUNO POR NOME
  # ========================================
  when 3
    puts "\n"
    puts "="*60
    puts "                   BUSCAR ALUNO"
    puts "="*60
    
    print "\nDigite o nome do aluno: "
    busca = gets.chomp.downcase
    
    encontrado = false
    
    alunos.each do |aluno|
      if aluno[:nome].downcase.include?(busca)
        encontrado = true
        media = calcular_media(aluno[:notas])
        
        puts "\n Aluno encontrado!"
        linha
        puts " Nome: #{aluno[:nome]}"
        puts " Idade: #{aluno[:idade]} anos"
        puts " Curso: #{aluno[:curso]}"
        puts " Notas: #{aluno[:notas]}"
        puts " Média: #{media}"
        puts "#{verificar_situacao(media)}"
        linha
      end
    end
    
    if !encontrado
      puts "\n Nenhum aluno encontrado com esse nome!"
    end
  
  # ========================================
  # OPÇÃO 4: ADICIONAR NOTA
  # ========================================
  when 4
    puts "\n"
    puts "="*60
    puts "               ADICIONAR NOTA"
    puts "="*60
    
    if alunos.empty?
      puts "\n Nenhum aluno cadastrado!"
    else
      print "\nNome do aluno: "
      nome = gets.chomp.downcase
      
      aluno_encontrado = nil
      
      alunos.each do |aluno|
        if aluno[:nome].downcase == nome
          aluno_encontrado = aluno
          break
        end
      end
      
      if aluno_encontrado
        print "Digite a nota (0 a 10): "
        nota = gets.chomp.to_f
        
        if nota >= 0 && nota <= 10
          aluno_encontrado[:notas].push(nota)
          nova_media = calcular_media(aluno_encontrado[:notas])
          
          puts "\n Nota #{nota} adicionada!"
          puts " Notas atuais: #{aluno_encontrado[:notas]}"
          puts " Nova média: #{nova_media}"
          puts "#{verificar_situacao(nova_media)}"
        else
          puts "\n ERRO: Nota deve estar entre 0 e 10!"
        end
      else
        puts "\n Aluno não encontrado!"
      end
    end
  
  # ========================================
  # OPÇÃO 5: RELATÓRIO COMPLETO
  # ========================================
  when 5
    puts "\n"
    puts "="*60
    puts "            RELATÓRIO COMPLETO DO ALUNO"
    puts "="*60
    
    if alunos.empty?
      puts "\n Nenhum aluno cadastrado!"
    else
      print "\nNome do aluno: "
      nome = gets.chomp.downcase
      
      aluno_encontrado = nil
      
      alunos.each do |aluno|
        if aluno[:nome].downcase == nome
          aluno_encontrado = aluno
          break
        end
      end
      
      if aluno_encontrado
        notas = aluno_encontrado[:notas]
        media = calcular_media(notas)
        
        puts "\n"
        puts "╔" + "═"*58 + "╗"
        puts "║" + " "*58 + "║"
        puts "║" + "   RELATÓRIO ACADÊMICO".center(58) + "║"
        puts "║" + " "*58 + "║"
        puts "╠" + "═"*58 + "╣"
        puts "║   Nome: #{aluno_encontrado[:nome]}".ljust(59) + "║"
        puts "║   Idade: #{aluno_encontrado[:idade]} anos".ljust(59) + "║"
        puts "║   Curso: #{aluno_encontrado[:curso]}".ljust(59) + "║"
        puts "╠" + "═"*58 + "╣"
        puts "║" + " "*58 + "║"
        puts "║   NOTAS:".ljust(59) + "║"
        
        if notas.empty?
          puts "║     Nenhuma nota registrada".ljust(59) + "║"
        else
          notas.each_with_index do |nota, i|
            puts "║     Avaliação #{i + 1}: #{nota}".ljust(59) + "║"
          end
          
          puts "║" + " "*58 + "║"
          puts "║   Quantidade de notas: #{notas.length}".ljust(59) + "║"
          puts "║   Média final: #{media}".ljust(59) + "║"
          puts "║  #{verificar_situacao(media)}".ljust(59) + "║"
        end
        
        puts "║" + " "*58 + "║"
        puts "╚" + "═"*58 + "╝"
      else
        puts "\n Aluno não encontrado!"
      end
    end
  
  # ========================================
  # OPÇÃO 6: RANKING
  # ========================================
  when 6
    puts "\n"
    puts "="*60
    puts "            RANKING - MELHORES MÉDIAS"
    puts "="*60
    
    if alunos.empty?
      puts "\n Nenhum aluno cadastrado!"
    else
      # Criar array com alunos e suas médias
      ranking = []
      
      alunos.each do |aluno|
        if !aluno[:notas].empty?
          media = calcular_media(aluno[:notas])
          ranking.push({
            nome: aluno[:nome],
            curso: aluno[:curso],
            media: media
          })
        end
      end
      
      if ranking.empty?
        puts "\n Nenhum aluno possui notas!"
      else
        # Ordenar por média (do maior para o menor)
        # Usando bubble sort simples
        (ranking.length - 1).times do
          ranking.length.times do |i|
            if i < ranking.length - 1
              if ranking[i][:media] < ranking[i + 1][:media]
                # Trocar posições
                temp = ranking[i]
                ranking[i] = ranking[i + 1]
                ranking[i + 1] = temp
              end
            end
          end
        end
        
        puts "\n"
        ranking.each_with_index do |aluno, i|
          medalha = ""
          if i == 0
            medalha = "ouro"
          elsif i == 1
            medalha = "prata"
          elsif i == 2
            medalha = "bronze"
          else
            medalha = "   "
          end
          
          puts "#{medalha} #{i + 1}º lugar - #{aluno[:nome]}"
          puts "     #{aluno[:curso]}"
          puts "     Média: #{aluno[:media]}"
          puts ""
        end
      end
    end
  
  # ========================================
  # OPÇÃO 7: ESTATÍSTICAS GERAIS
  # ========================================
  when 7
    puts "\n"
    puts "="*60
    puts "               ESTATÍSTICAS GERAIS"
    puts "="*60
    
    if alunos.empty?
      puts "\n Nenhum aluno cadastrado!"
    else
      total_alunos = alunos.length
      alunos_com_notas = 0
      aprovados = 0
      recuperacao = 0
      reprovados = 0
      soma_todas_medias = 0.0
      
      alunos.each do |aluno|
        if !aluno[:notas].empty?
          alunos_com_notas += 1
          media = calcular_media(aluno[:notas])
          soma_todas_medias += media
          
          if media >= 7.0
            aprovados += 1
          elsif media >= 5.0
            recuperacao += 1
          else
            reprovados += 1
          end
        end
      end
      
      media_geral = alunos_com_notas > 0 ? (soma_todas_medias / alunos_com_notas).round(2) : 0
      
      puts "\n DADOS GERAIS:"
      linha
      puts "Total de alunos cadastrados: #{total_alunos}"
      puts "Alunos com notas: #{alunos_com_notas}"
      puts "Alunos sem notas: #{total_alunos - alunos_com_notas}"
      puts ""
      puts " DESEMPENHO:"
      linha
      puts " Aprovados: #{aprovados}"
      puts "  Em recuperação: #{recuperacao}"
      puts " Reprovados: #{reprovados}"
      puts ""
      puts " Média geral da turma: #{media_geral}"
      linha
    end
  
  # ========================================
  # OPÇÃO 8: EDITAR ALUNO
  # ========================================
  when 8
    puts "\n"
    puts "="*60
    puts "                EDITAR DADOS DO ALUNO"
    puts "="*60
    
    if alunos.empty?
      puts "\n Nenhum aluno cadastrado!"
    else
      print "\nNome do aluno: "
      nome = gets.chomp.downcase
      
      aluno_encontrado = nil
      
      alunos.each do |aluno|
        if aluno[:nome].downcase == nome
          aluno_encontrado = aluno
          break
        end
      end
      
      if aluno_encontrado
        puts "\nDados atuais:"
        puts "Nome: #{aluno_encontrado[:nome]}"
        puts "Idade: #{aluno_encontrado[:idade]}"
        puts "Curso: #{aluno_encontrado[:curso]}"
        
        print "\nNovo nome (Enter para manter): "
        novo_nome = gets.chomp
        aluno_encontrado[:nome] = novo_nome unless novo_nome.empty?
        
        print "Nova idade (Enter para manter): "
        nova_idade = gets.chomp
        aluno_encontrado[:idade] = nova_idade.to_i unless nova_idade.empty?
        
        print "Novo curso (Enter para manter): "
        novo_curso = gets.chomp
        aluno_encontrado[:curso] = novo_curso unless novo_curso.empty?
        
        puts "\n Dados atualizados com sucesso!"
      else
        puts "\n Aluno não encontrado!"
      end
    end
  
  # ========================================
  # OPÇÃO 9: REMOVER ALUNO
  # ========================================
  when 9
    puts "\n"
    puts "="*60
    puts "                REMOVER ALUNO"
    puts "="*60
    
    if alunos.empty?
      puts "\n Nenhum aluno cadastrado!"
    else
      print "\nNome do aluno: "
      nome = gets.chomp.downcase
      
      indice_remover = nil
      
      alunos.each_with_index do |aluno, i|
        if aluno[:nome].downcase == nome
          indice_remover = i
          break
        end
      end
      
      if indice_remover
        print "\n  Tem certeza que deseja remover '#{alunos[indice_remover][:nome]}'? (s/n): "
        confirmacao = gets.chomp.downcase
        
        if confirmacao == "s" || confirmacao == "sim"
          nome_removido = alunos[indice_remover][:nome]
          alunos.delete_at(indice_remover)
          puts "\n Aluno '#{nome_removido}' removido com sucesso!"
        else
          puts "\n Operação cancelada!"
        end
      else
        puts "\n Aluno não encontrado!"
      end
    end
  
  # ========================================
  # OPÇÃO 0: SAIR
  # ========================================
  when 0
    puts "\n"
    puts "="*60
    puts "            ENCERRANDO SISTEMA..."
    puts "="*60
    puts "\n Resumo da sessão:"
    puts "   • Total de alunos: #{alunos.length}"
    puts "   • Cadastros realizados: #{total_cadastros}"
    puts "\n Obrigado por usar o Sistema de Gerenciamento Escolar!"
    puts "="*60
    break
  
  # ========================================
  # OPÇÃO INVÁLIDA
  # ========================================
  else
    puts "\n ERRO: Opção inválida! Escolha um número de 0 a 9."
  end
end


