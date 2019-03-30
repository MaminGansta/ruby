require_relative 'io'
require_relative 'person'
require_relative 'position'

class Storage

  def initialize
    @persons_array  = Io.fill_persons_array
    @position_arrray = Io.fill_vacancy_array
    @count_workers = Io.count_workers
  end


end
