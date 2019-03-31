# frozen_string_literal: true

class Position
  attr_reader :name, :dep, :pay, :age, :deg, :prof

  def initialize(name, dep, pay, age, deg, prof, amount)
    @name = name
    @dep  = dep
    @pay = pay
    @max_age = age
    @deg = deg
    @prof = prof
    @amount = amount
    @workers = []
  end

  def add_worker(worker)
    @workers << wroker
  end

  def to_s
    "#{@name} #{@dep} #{@pay} #{@age} #{@deg} #{@prof} #{@amount}"
  end
end
