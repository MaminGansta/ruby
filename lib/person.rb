class Person
  attr_reader :name, :deg, :prof

  def initialize(name, deg, prof)
    @name = name
    @deg = deg
    @prof = prof
    
  end

  def to_s
     "name is #{@name} deg #{@deg} prof #{@prof}"
  end
end
