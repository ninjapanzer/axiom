# encoding: utf-8

require 'spec_helper'

describe Attribute, '#optional?' do
  subject { object.optional? }

  let(:described_class) { Class.new(Attribute) }

  before do
    described_class.stub(type: Types::Object)
  end

  context 'without :required option passed to constructor' do
    let(:object) { described_class.new(:name) }

    it { should be(false) }
  end

  context 'with required: true option passed to constructor' do
    let(:object) { described_class.new(:name, required: true) }

    it { should be(false) }
  end

  context 'with required: false option passed to constructor' do
    let(:object) { described_class.new(:name, required: false) }

    it { should be(true) }
  end
end
