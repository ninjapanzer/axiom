require 'spec_helper'

describe Logic::Connective::Conjunction, '.call' do
  subject { object.call(left, right) }

  let(:object) { Logic::Connective::Conjunction }

  context 'when left is true and right is true' do
    let(:left)  { true }
    let(:right) { true }

    it { should be(true) }
  end

  context 'when left is true and right is false' do
    let(:left)  { true  }
    let(:right) { false }

    it { should be(false) }
  end

  context 'when left is false and right is true' do
    let(:left)  { false }
    let(:right) { true  }

    it { should be(false) }
  end

  context 'when left is false and right is false' do
    let(:left)  { false }
    let(:right) { false }

    it { should be(false) }
  end
end
