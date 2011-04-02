require 'spec_helper'

describe Logic::Predicate::Exclusion, '#inverse' do
  subject { object.inverse }

  let(:klass)      { Logic::Predicate::Exclusion      }
  let(:attribute)  { Attribute::Integer.new(:id)      }
  let(:enumerable) { [ 1 ].freeze                     }
  let(:object)     { klass.new(attribute, enumerable) }

  it_should_behave_like 'an idempotent method'

  it { should be_kind_of(Logic::Predicate::Inclusion) }

  its(:left) { should equal(attribute) }

  its(:right) { should equal(enumerable) }

  it 'is invertible' do
    subject.inverse.should equal(object)
  end
end
