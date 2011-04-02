require 'spec_helper'

describe Algebra::Summarization, '#hash' do
  subject { object.hash }

  let(:klass)        { Algebra::Summarization                               }
  let(:operand)      { Relation.new([ [ :id, Integer ] ], [ [ 1 ], [ 2 ] ]) }
  let(:summarize_by) { operand.project([])                                  }
  let(:summarizers)  { { :count => lambda { |acc, tuple| acc.to_i + 1 } }   }
  let(:object)       { klass.new(operand, summarize_by, summarizers)        }

  it_should_behave_like 'a hash method'

  it { should == klass.hash ^ operand.hash ^ summarize_by.hash ^ summarizers.hash }
end
