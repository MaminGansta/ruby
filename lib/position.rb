# frozen_string_literal: true

class Position
  attr_reader :name, :dep, :pay, :age, :deg, :prof

  def initialize(name, dep, pay, age, deg, prof, amount = "0")
    @name = name
    @dep  = dep
    @pay = pay
    @age = age
    @deg = deg
    @prof = prof
    @amount = amount
  end

  def to_s
    "#{name} #{dep} #{pay} #{age} #{deg} #{prof}"
  end
end
