require_relative 'person'
require_relative 'vacancy'
require_relative 'file_io'

class Menu

  def menu
    file = File_io.new
    persons_array  = file.fill_persons_array
    vacancy_arrray = file.fill_vacancy_array

    persons_array.each {|x| puts x}

  end

  def command_block
  end

end
