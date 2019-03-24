require_relative 'person'
require_relative 'vacancy'
require 'psych'

class Menu

  def menu
    data = Psych.load_file(File.expand_path('../data/all_data.yaml',__dir__))
    persons_array = fill_persons(data['person'])
    vacancy_arrray = fill_vacancy(data['vacancy'])

    puts "#{vacancy_arrray}"
    puts "#{persons_array}"

  end

  def fill_vacancy(vacancy)
    vacancy_arrray = []
    vacancy.each do |hash|
      vacancy_arrray.push(Vacancy.new(hash))
    end
  end

  def fill_persons(persons)
    persons_array = []
    persons.each do |hash|
      persons_array.push(Person.new(hash))
    end
  end

  def file_out(res)
    res = Psych.dump(data)
    File.open(File.expand_path('../data/res_data.yaml',__dir__),'w') do |f|
      f.puts "#{res} + 1"
    end
  end

end
