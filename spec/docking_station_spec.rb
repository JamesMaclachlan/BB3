require 'docking_station'

describe DockingStation do
  
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'dock' do
    it 'raises error when full' do
      subject.capacity.times { subject.dock double :bike }
    expect { subject.dock double (:bike) }.to raise_error 'Docking station full'
    end
  end


  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  it 'does not release broken bikes' do
    bike = double(:bike, broken?: true)
    subject.dock bike
    expect {subject.release_bike}.to raise_error 'No bikes available'
  end

  it 'releases working bikes' do
    bike = double(:bike, broken?: false)
    subject.dock bike
    expect(subject.release_bike).to be bike
  end

end
