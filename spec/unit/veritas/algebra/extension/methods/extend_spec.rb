require 'spec_helper'

describe Algebra::Extension::Methods, '#extend' do
  subject { object.extend(&block) }

  let(:klass)      { Relation                                        }
  let(:extensions) { [ :test, lambda { |tuple| 1 } ]                 }
  let(:block)      { lambda { |r| r.add(*extensions) }               }
  let(:object)     { klass.new([ [ :id, Integer ] ], [ [ 1 ] ].each) }

  it { should be_kind_of(Algebra::Extension) }

  its(:operand) { should equal(object) }
end
