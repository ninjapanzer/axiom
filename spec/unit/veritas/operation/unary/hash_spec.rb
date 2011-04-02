require 'spec_helper'

describe Operation::Unary, '#hash' do
  subject { object.hash }

  let(:klass)   { Class.new { include Operation::Unary } }
  let(:operand) { mock('Operand').freeze                 }
  let(:object)  { klass.new(operand)                     }

  it_should_behave_like 'a hash method'

  it { should == klass.hash ^ operand.hash }
end
