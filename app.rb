require "./manifestacao.rb"

def obterId
  print "Digite o id da manifestacao que deseja: "
  id = gets.chomp.to_i
end

def cadastrar(manifestacoes)
  puts "\n==Cadastrar Manifestacao=="
  print "Digite o titulo: "
  titulo = gets.chomp
  print "Digite o autor: "
  autor = gets.chomp
  print "Digite o descricao: "
  descricao = gets.chomp
  
  manifestacao = Manifestacao.new
  manifestacao.setId
  manifestacao.setAttributes(titulo, autor, descricao)
  manifestacao.setTimeStamp
  manifestacoes << manifestacao

  puts "\nManifestacao cadastrada com sucesso!\n"
end

def listar(manifestacoes)
  puts "\n==Lista de Manifestacoes=="
  unless manifestacoes.empty?
    manifestacoes.each do |manifestacao|
      manifestacao.toString
    end
  else
    puts "Nao ha manifestacoes cadastradas no sistema"
  end
end

def obterPorId(manifestacoes)
  puts "\n==Obter manifestacao por id==\n"
  id = obterId

  manifestacoesFiltrada = manifestacoes.select do |manifestacao| 
    manifestacao.id == id
  end

  if manifestacoesFiltrada.size == 0
    puts "\nId invalido"
  else
    manifestacoesFiltrada[0].toString
  end
end

def deletar(manifestacoes)
  puts "\n==Deletar Manifestacao por id\n"
  id = obterId
  
  indx = 0
  manifestacoes.each do |manifestacao|
    if manifestacao.id == id
      break
    else
      indx += 1
    end
  end

  manifestacoes.delete_at(indx)
  puts "\nManifestacao de id #{id} deletada com sucesso!"
end


manifestacoes = Array.new

menu = "
  1 - Cadastrar manifestacao
  2 - Listar manifestacoes
  3 - Obter manifestacao por id
  4 - Deletar manifestacao por id
  5 - Sair

"

loop do 

  puts menu

  print "Insira sua opcao: "
  opcao = gets.chomp.to_i 

  case opcao
    #Cadastrar
  when 1
    cadastrar(manifestacoes)

    #Listar 
  when 2
    listar(manifestacoes)

    #Obter manifestacao por id
  when 3
    obterPorId(manifestacoes)

    #Deletar
  when 4
    deletar(manifestacoes)

    #Sair
  when 5
    puts "Obrigado por usar nosso sistema"
  end
  break if opcao == 5
end

