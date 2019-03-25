require_relative 'person'
require_relative 'vacancy'
require 'psych'

class Menu

  def menu
    data = Psych.load_file(File.expand_path('../data/all_data.yaml',__dir__))
    persons_array = fill_persons(data['person'])
    vacancy_arrray = fill_vacancy(data['vacancy'])

    persons_array.each do |f|
      puts f.to_s
    end

  end

  def fill_vacancy(vacancy)
    vacancy_arrray = []
    vacancy.each do |h|
      vacancy_arrray.push(Vacancy.new(h['name'],h['dep'],h['pay'],
                                       h['age'],h['dep'],h['prof']))
    end
  end

  def fill_persons(persons)
    persons_array = []
    persons.each do |h|
      persons_array.push(Person.new(h['name'],h['deg'],h['prof']))

      puts Person.new(h['name'],h['deg'],h['prof'])
    end
  end

  def file_out(res)
    res = Psych.dump(data)
    File.open(File.expand_path('../data/res_data.yaml',__dir__),'w') do |f|
      f.puts "#{res} + 1"
    end
  end

end
