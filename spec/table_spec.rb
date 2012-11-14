require 'spec_helper'
describe Table do
  it "should recognise valid positions" do
    table = Table.new(5,5)
    table.valid_position?(0,0).should == true
    table.valid_position?(0,4).should == true
    table.valid_position?(4,0).should == true
    table.valid_position?(4,4).should == true
  end
  it "should recognise invalid positions" do
    table = Table.new(5,5)
    table.valid_position?(-1,0).should == false
    table.valid_position?(0,-1).should == false
    table.valid_position?(5,0).should == false
    table.valid_position?(0,5).should == false
  end
end