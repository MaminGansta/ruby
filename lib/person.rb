# frozen_string_literal: true

class Person
  include Comparable
  attr_reader :name, :deg, :prof, :position, :age
  attr_writer :position

  def initialize(name, age, deg, prof, position = 'unemployed')
    @name = name
    @age = age
    @deg = deg
    @prof = prof
    @position = position
  end

  def <=>(other)
    @name <=> other.name
  end

  def to_s
    "#{@name} #{@age} #{@deg} #{@prof} #{@position}"
  end
end
