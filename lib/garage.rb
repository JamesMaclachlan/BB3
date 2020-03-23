class Garage

  def fix_bikes
    bikes = @bikes
    bikes.each do |bike|
      bike.working? == true
    end
  end
end

#will garages need to accept or will the van method be enough?
