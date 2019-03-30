require_relative 'person'
require 'psych'

module Io

  file = File.expand_path('../data/all_data.yaml',__dir__)

  def fill_position_array
    vacancy_arrray = []
    # array of hashes
    @data['vacancy'].each do |h|
      vacancy_arrray << (Vacancy.new(h['name'],h['dep'],h['pay'],
                                       h['age'],h['dep'],h['prof']))
    end
    vacancy_arrray
  end

  def fill_persons_array
    persons_array = []
    @data['person'].each do |h|
      persons_array << Person.new(h['name'], h['age'],
                                   h['deg'], h['prof'])
    end
    persons_array
  end

  def count_workers
    @data['count_workers']
  end

  def file_out(res)
    res = Psych.dump(data)
    File.open(File.expand_path('../data/res_data.yaml',__dir__),'w') do |f|
      f.puts "#{res} + 1"
    end
  end

end
