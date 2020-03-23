class Bike
  def working?
    false
  end
  def report_broken
    @broken = true
  end
  def broken?
    @broken
  end
end
