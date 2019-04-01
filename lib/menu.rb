# frozen_string_literal: true

require_relative 'person'
require_relative 'position'
require_relative 'storage_jacket'
require_relative 'io'

module Employment
  class Core
    def initialize
      @commands = { 'help' => :help, 'personr' => :remove_person, 'persona' => :add_person,
                    'selection' => :selection, 'showp' => :show_persons, 'showv' => :show_vacancy,
                    'psortn' => :psortn, 'psortp' => :psortp, 'salary' => :show_salary,
                    'positiona' => :add_position, 'positionr' => :remove_position, 'exit' => :exit }
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
          next
        end

        puts ''

        file_out if command == :exit

        send(command)
      end
    end

    private

    def file_out
      @data.file_out
    end

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
      puts 'Name and surname'
      name = IO.input_str
      puts 'Department'
      dep = IO.input_str
      puts 'Salary'
      pay = IO.input_num
      puts 'Age limit'
      age = IO.input_num
      puts 'Degree'
      deg = IO.input_str
      puts 'Proffesion'
      prof = IO.input_str
      puts 'Amount'
      amount = IO.input_num

      @data.add_position(name, dep, pay, age, deg, prof, amount)
    end

    def remove_person
      puts 'Enter name and surname'
      name = IO.input_str
      @data.rem_person(name)
    end

    def remove_position
      puts 'Enter name'
      name = IO.input_str
      @data.rem_position(name)
    end

    def show_persons
      @data.show_persons
    end

    def show_vacancy
      @data.show_vacancy
    end

    def psortn
      @data.sort_by_name
    end

    def psortp
      @data.sort_by_position
    end

    def show_salary
      puts "total salary: #{@data.salary}"
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

    def selection
      @data.selection
    end
  end
end
