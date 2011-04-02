require 'spec_helper'

describe Algebra::Summarization, '#summarize_by' do
  subject { object.summarize_by }

  let(:klass)       { Algebra::Summarization                               }
  let(:operand)     { Relation.new([ [ :id, Integer ] ], [ [ 1 ], [ 2 ] ]) }
  let(:summarizers) { { :test => lambda { |acc, tuple| 1 } }               }
  let(:object)      { klass.new(operand, operand, summarizers)             }

  it_should_behave_like 'an idempotent method'

  it { should equal(operand) }
end
