require 'spec_helper'

describe Table do
  it "recognises valid positions" do
    table = Table.new(5,5)
    expect(table.valid_position?(Position.new(0,0))).to eq true
    expect(table.valid_position?(Position.new(0,4))).to eq true
    expect(table.valid_position?(Position.new(4,0))).to eq true
    expect(table.valid_position?(Position.new(4,4))).to eq true
  end
  it "recognises invalid positions" do
    table = Table.new(5,5)
    expect(table.valid_position?(Position.new(-1,0))).to eq false
    expect(table.valid_position?(Position.new(0,-1))).to eq false
    expect(table.valid_position?(Position.new(5,0))).to eq false
    expect(table.valid_position?(Position.new(0,5))).to eq false
  end
end
