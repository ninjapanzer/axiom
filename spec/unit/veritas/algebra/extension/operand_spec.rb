require 'spec_helper'

describe Algebra::Extension, '#operand' do
  subject { object.operand }

  let(:klass)      { Algebra::Extension                                   }
  let(:operand)    { Relation.new([ [ :id, Integer ] ], [ [ 1 ], [ 2 ] ]) }
  let(:extensions) { { :test => lambda { |tuple| 1 } }                    }
  let(:object)     { klass.new(operand, extensions)                       }

  it_should_behave_like 'an idempotent method'

  it { should equal(operand) }
end
