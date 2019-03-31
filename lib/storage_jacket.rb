# frozen_string_literal: true

require_relative 'io'
require_relative 'person'
require_relative 'position'

module Employment
  class Storage
    def initialize
      @file = IO::File_io.new
      @persons_array = @file.fill_persons_array
      @position_arrray = @file.fill_position_array

      pp @persons_array
      pp @position_arrray
    end


    def add_person(name, age, deg, prof)
      @persons_array << Person.new(name, age, deg, prof)
    end

    def add_position(name, dep, pay, age, deg, prof, amount)
      @position_arrray << Position.new(name, dep, pay, age, deg, prof, amount)
    end


    def rem_person

    end

    def rem_positin

    end


    def sort_by_name
    end

    def sort_by_positon
    end


    def show_vacancy
    end

    def show_persons
      @persons_array.each {|person| puts person}
    end


    def res_pay
    end


  end
end
