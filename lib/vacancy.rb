class Vacancy
  attr_reader :name, :dep, :pay, :age, :deg, :prof

  def initialize(data)
    @name = data['name']
    @dep  = data['dep']
    @pay = data['pay']
    @age = data['age']
    @deg = data['deg']
    @prof = data['prof']
  end

  def to_s
    return "#{name} #{dep} #{pay} #{age} #{deg} #{prof}"
  end

end
