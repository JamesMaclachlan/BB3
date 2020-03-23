require_relative 'bike'
require_relative 'docking_station'

class Van

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  attr_reader :bikes

  def pick_bike
    bikes << bike
  end

  def deliver_bikes
  end

  def collect(bike)
  end

  def distribute(bike)
  end

end
