require_relative 'person'
require 'psych'

module Employment

 module Io

  FILE = File.expand_path('../data/all_data.yaml',__dir__)

  class File_io

    def initialize
      if File.exist?(FILE)
        @data = Psych.load_file(FILE)
      else
        @data = nil
      end
    end


    def fill_position_array
      position_arrray = []
      # array of hashes
      @data['position'].each do |h|
        position_arrray << (Position.new(h['name'], h['dep'], h['pay'],
                                         h['age'], h['dep'], h['prof']))
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


    def self.input_str
      loop do
        str = gets
        str.strip

        if str.empty?
          puts 'line is empty'
          next
        end

        return str
      end
    end

    def input_num

    end

 end
end
