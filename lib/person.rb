# frozen_string_literal: true

class Person
  attr_reader :name, :deg, :prof

  def initialize(name, age, deg, prof, position)
    @name = name
    @age = age
    @deg = deg
    @prof = prof
    @position = position
  end

  def to_s
    "name is #{@name} deg #{@deg} prof #{@prof}"
  end
end
