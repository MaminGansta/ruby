class Person
  attr_reader :name, :degree, :profession

  def initialize(data)
    @name = data['name']
    @degree = data['degree']
    @profession = data['profession']
  end

  def to_s
     return "name is #{@name} deg #{@degree} prof #{@profession}"
  end
end
