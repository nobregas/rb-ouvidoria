require "./utils.rb"

class Manifestacao
  attr_accessor :id, :titulo, :autor, :descricao, :data

  def setAttributes(titulo, autor, descricao)
    @titulo = titulo
    @autor = autor
    @descricao = descricao
  end

  def setId()
    @id = Utils::AutoIncrementId::get_id
  end

  def setTimeStamp
    @data = Time.now
  end

  def toString
    puts "Id: #{@id}"
    puts "titulo: #{@titulo}"
    puts "autor: #{@autor}"
    puts "descricao: #{@descricao}"
    puts "Data: #{@data}"
    puts "\n"
  end

end