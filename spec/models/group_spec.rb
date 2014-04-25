require 'spec_helper'

describe Group do
  before { @group = Group.new(:name => "Test Group", :members => [1,2] ) }
  subject { @group }
  
  it { should respond_to(:name) }
  it { should respond_to(:members) }


  
end
