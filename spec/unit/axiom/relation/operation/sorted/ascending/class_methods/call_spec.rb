# encoding: utf-8

require 'spec_helper'

describe Relation::Operation::Sorted::Ascending, '.call' do
  subject { object.call(left, right) }

  let(:object) { described_class }

  context 'when left is equal to right' do
    let(:left)  { 1 }
    let(:right) { 1 }

    it { should be(0) }
  end

  context 'when left is greater than right' do
    let(:left)  { 2 }
    let(:right) { 1 }

    it { should be(1) }
  end

  context 'when left is less than right' do
    let(:left)  { 1 }
    let(:right) { 2 }

    it { should be(-1) }
  end

  context 'when left and right are nil' do
    let(:left)  { nil }
    let(:right) { nil }

    it { should be(0) }
  end

  context 'when left is nil' do
    let(:left)  { nil }
    let(:right) { 2   }

    it { should be(1) }
  end

  context 'when right is nil' do
    let(:left)  { 1   }
    let(:right) { nil }

    it { should be(-1) }
  end
end
