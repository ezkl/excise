require "spec_helper"

describe Excise do
  describe ".new" do
    subject { Excise.new('{key}') }
    it { should be_a Excise::Base }
  end

  describe ".parse" do
    subject { Excise.parse(pattern, string) }

    let(:pattern) { '[{first}] ({second}) <{third}>' }
    let(:string)  { '[this] (patterned) <STRING>' }

    it { should be_a Hash }
  end

  describe "Excise convenience method" do
    subject { Excise(pattern, string) }
    let(:pattern) { '[{first}]' }
    let(:string)  { '[first]' }

    it { should be_a Hash }
  end
end
