# frozen_string_literal: true

require_relative 'person'
require 'psych'

module Employment
  module IO
    FILE = File.expand_path('../data/all_data.yaml', __dir__)

    class File_io
      def initialize
        @data = (Psych.load_file(FILE) if File.exist?(FILE))
      end

      def fill_position_array
        position_arrray = []
        # array of hashes
        @data['position'].each do |h|
          position_arrray << Position.new(h['name'], h['dep'], h['pay'],
                                          h['max_age'], h['deg'], h['prof'], h['amount'])
        end
        position_arrray
      end

      def fill_persons_array
        persons_array = []
        @data['person'].each do |h|
          persons_array << Person.new(h['name'], h['age'], h['deg'],
                                      h['prof'], h['position'])
        end
        persons_array
      end

      def file_out(res)
        res_to_file = Psych.dump(res)
        File.open(File.expand_path('../data/res_data.yaml', __dir__), 'w') do |f|
          f.puts "#{res_to_file}"
        end
      end
    end

    def self.input_str
      loop do
        str = gets
        str.strip

        if str.empty?
          puts 'line is empty'
          next
        end

        return str.strip
      end
    end

    def self.input_num
      loop do
        line = gets.strip
        if line.strip.empty?
          puts 'try agen'
          next
        end
        return line.strip.to_i
      end
    end
  end
end
