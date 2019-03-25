class Person
  attr_reader :name, :degree, :profession

  def initialize(name, degree, profession)
    @name = dname
    @deg = degree
    @prof = profession
  end

  def to_s
     "name is #{@name} deg #{@deg} prof #{@prof}"
  end
end
