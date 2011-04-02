require 'spec_helper'

describe Optimizer::Algebra::Difference::EmptyLeft, '#optimize' do
  subject { object.optimize }

  let(:klass)    { Optimizer::Algebra::Difference::EmptyLeft  }
  let(:header)   { Relation::Header.new([ [ :id, Integer ] ]) }
  let(:left)     { Relation::Empty.new(header)                }
  let(:right)    { Relation.new(header, [ [ 1 ] ].each)       }
  let(:relation) { left.difference(right)                     }
  let(:object)   { klass.new(relation)                        }

  before do
    object.operation.should be_kind_of(Algebra::Difference)
  end

  it { should equal(left) }
end
