require 'spec_helper'

describe Logic::Predicate::Equality, '.reverse' do
  subject { object.reverse }

  let(:object) { Logic::Predicate::Equality }

  it { should equal(object) }
end
