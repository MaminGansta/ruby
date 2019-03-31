# frozen_string_literal: true

require_relative 'person'
require_relative 'position'
require_relative 'storage_jacket'
require_relative 'io'

module Employment
  class Core
    def initialize
      @commands = {'help' => :help, 'personr' => :remove_person, 'persona' => :add_person,
                   'selection' => :selection, 'showp' => :showp, 'showv' => :vacancy,
                   'psortn' => :psortn , 'psortp' => :psortp, 'salary' => :salary,
                   'positiona' => :position_add, 'positionr' => :position_remove }
      @data = Storage.new
    end

    def menu
      send(:help)

      loop do
        input = Io.in_str
        command = commands['input']

        if command.nil?
          puts 'wrong command'
          next
        end

        send(command)
      end
    end

    private

    def exit
      puts 'kek'
      exit
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
