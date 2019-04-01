# frozen_string_literal: true

class Position
  attr_reader :name, :dep, :pay, :max_age, :deg, :prof, :amount

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
    @workers << worker
  end

  def workers_size
    @workers.size
  end

  def to_s
    "#{@name} #{@dep} #{@pay} #{@age} #{@deg} #{@prof} #{@amount}"
  end

  def to_salary_file
    "#{@name}  workers - #{@workers.size}"
  end
end
