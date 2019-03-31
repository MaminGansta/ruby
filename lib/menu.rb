# frozen_string_literal: true

require_relative 'person'
require_relative 'position'
require_relative 'storage_jacket'
require_relative 'io'

module Employment
  class Core
    def initialize
      @commands = {'help' => :help, 'personr' => :remove_person, 'persona' => :add_person,
                   'selection' => :selection, 'showp' => :show_persons, 'showv' => :show_vacancy,
                   'psortn' => :psortn , 'psortp' => :psortp, 'salary' => :salary,
                   'positiona' => :add_position, 'positionr' => :position_remove, 'exit' => :exit }
      @data = Storage.new
    end

    def menu
      send(:help)

      loop do
        puts "\n menu section \n"
        input = IO.input_str

        command = @commands[input.strip]

        if command.nil?
          puts command
          puts 'wrong command'
          next
        end

        puts ''
        send(command)
      end
    end

    private

    def add_person
      puts 'Entir name and surname'
      name = IO.input_str
      puts 'Enter age'
      age = IO.input_num
      puts 'Enter degree'
      deg = IO.input_str
      puts 'Enter profession'
      prof = IO.input_str

      @data.add_person(name, age, deg, prof)
    end

    def add_position
      puts 'name'
      puts 'dep'
      puts 'pay'
      puts 'max_age'
      puts 'prof'
      puts 'amount'
    end

    def show_persons
      @data.show_persons
    end

    def show_vacancy
    end


    def help
      puts '
            help - command list
            personr - remove person
            persona - add person
            positiona - add position
            positionr - remove position
            showp - show persons
            whowv - whow free position
            selection - every person get a suitable job (if it posible)
            psortn - persons sort by name
            psortp - persons sort by positions
            '
    end

  end
end
