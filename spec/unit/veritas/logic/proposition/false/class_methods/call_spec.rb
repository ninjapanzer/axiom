require 'spec_helper'

describe Logic::Proposition::False, '.call' do
  subject { object.call }

  let(:object) { Logic::Proposition::False }

  it { should be(false) }
end
