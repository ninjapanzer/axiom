require 'spec_helper'

describe 'Veritas::Optimizer::Algebra::Restriction.optimize_predicate' do
  subject { object.optimize_predicate(predicate) }

  let(:attribute) { Attribute::Integer.new(:id)     }
  let(:predicate) { attribute.eq(1)                 }
  let(:object)    { Optimizer::Algebra::Restriction }

  context 'when the predicate is optimizable' do
    let(:predicate) { Logic::Connective::Complement.new(attribute.eq(1)) }

    it { should eql(attribute.ne(1)) }
  end

  context 'when the predicate is optimizable, but already optimized' do
    let(:predicate) { attribute.eq(1) }

    it { should equal(predicate) }
  end

  context 'when the predicate is not optimizable' do
    let(:predicate) { lambda { |tuple| tuple[:id] == 1 } }

    it { should equal(predicate) }
  end
end