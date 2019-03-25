class Vacancy
  attr_reader :name, :dep, :pay, :age, :deg, :prof

  def initialize(name, dep, pay, age, deg, prof)
    @name = name
    @dep  = dep
    @pay = pay
    @age = age
    @deg = deg
    @prof = prof
  end

  def to_s
    "#{name} #{dep} #{pay} #{age} #{deg} #{prof}"
  end

end
