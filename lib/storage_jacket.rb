# frozen_string_literal: true

require_relative 'io'
require_relative 'person'
require_relative 'position'

module Employment
  class Storage
    def initialize
      @file = IO::File_io.new
      @persons_array = @file.fill_persons_array
      @position_array = @file.fill_position_array
      original_selection
    end

    def add_person(name, age, deg, prof)
      @persons_array << Person.new(name, age, deg, prof)
    end

    def add_position(name, dep, pay, age, deg, prof, amount)
      @position_array << Position.new(name, dep, pay, age, deg, prof, amount)
    end

    def rem_person(name)
      @persons_array.delete_if { |person| person.name == name }
    end

    def rem_position(name)
      @position_array.delete_if { |position| position.name == name }
    end

    def sort_by_name
      @persons_array = @persons_array.sort_by(&:name)
    end

    def sort_by_position
      @persons_array = @persons_array.sort_by(&:position)
    end

    def show_vacancy
      @position_array.each do |p|
        if p.workers_size < p.amount
          free = p.amount - p.workers_size
          puts "#{p.name} free places: #{free}"
        end
      end
    end

    def show_persons
      @persons_array.each { |person| puts person }
    end

    def salary
      sum = 0
      res = ''
      @position_array.each do |position|
        sum += position.pay * position.workers_size
        res = res + "\n#{position.name} " + "salary -#{position.pay * position.workers_size}"
      end

      File.open(File.expand_path('../data/salary_report.txt', __dir__), 'w') do |f|
        f.puts res
      end

      sum
    end

    def file_out
      hash_res = {}
      person_hash_array = []
      position_hash_array = []
      @persons_array.each do |person|
        person_hash_array << { 'name' => person.name, 'age' => person.age, 'prof' => person.prof,
                               'deg' => person.deg, 'position' => person.position }
      end
      @position_array.each do |position|
        position_hash_array << { 'name' => position.name, 'max_age' => position.max_age, 'prof' => position.prof,
                                 'deg' => position.deg, 'amount' => position.amount, 'pay' => position.pay }
      end
      hash_res = { 'peson' => person_hash_array, 'position' => position_hash_array }

      @file.file_out(hash_res)
    end

    def original_selection
      @persons_array.each do |person|
        @position_array.each_with_index do |position, i|
          @position_array[i].add_worker(person) if person.position == position.name
        end
      end
    end

    def selection
      @persons_array.each_with_index do |person, i|
        @position_array.each_with_index do |position, j|
          puts i
          puts j
          pp person
          pp position
          break if position.amount == position.workers_size

          next if person.age < 18 || person.age > position.max_age

          next if person.deg != position.deg

          next if person.prof != position.prof

          @position_array[j].add_worker(person)
          @persons_array[i].position = position.name
        end
      end
    end
  end
end
