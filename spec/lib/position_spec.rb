require 'spec_helper'

describe Position do
  describe '#move' do
    let(:subject) { Position.new(1,1) }
    it "moves north" do
      expect(subject.move(Direction::NORTH)).to eq Position.new(1, 2)
    end
    it "moves south" do
      expect(subject.move(Direction::SOUTH)).to eq Position.new(1, 0)
    end
    it "moves east" do
      expect(subject.move(Direction::EAST)).to eq Position.new(2, 1)
    end
    it "moves west" do
      expect(subject.move(Direction::WEST)).to eq Position.new(0, 1)
    end
  end
  
  describe "#between?" do
    let(:subject) { Position.new(1,1) }
    it "returns true for in range" do
      expect(subject.between?(1..1, 1..1)).to be_truthy
    end
    it "returns false for x too high" do
      expect(subject.between?(-4..0, 0..5)).to be_falsy
    end
    it "returns false for x too low" do
      expect(subject.between?(2..66, 0..5)).to be_falsy
    end
    it "returns false for y too high" do
      expect(subject.between?(0..5, -4..0)).to be_falsy
    end
    it "returns false for y too low" do
      expect(subject.between?(0..5, 2..33)).to be_falsy
    end
  end
end
