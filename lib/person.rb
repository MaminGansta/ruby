class Person
  attr_reader :name, :deg, :prof

  def initialize(name, age, deg, prof)
    @name = name
    @age = age
    @deg = deg
    @prof = prof
  end

  def to_s
     "name is #{@name} deg #{@deg} prof #{@prof}"
  end
end
