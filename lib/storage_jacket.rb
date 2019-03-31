# frozen_string_literal: true

require_relative 'io'
require_relative 'person'
require_relative 'position'

module Employment
  class Storage
    def initialize
      @file = Io::File_io.new
      @persons_array = @file.fill_persons_array
      @position_arrray = @file.fill_position_array
      @count_workers = @file.count_workers
    end


    def add_person
    end

    def add_position
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
    end


    def res_pay
    end


  end
end
