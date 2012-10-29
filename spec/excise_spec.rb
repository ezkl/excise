require "spec_helper"

describe Excise do
  describe ".parse" do
    subject { Excise.parse(string, pattern) }

    let(:string)  { '[this] (patterned) <STRING>' }
    let(:pattern) { '[{first}] ({second}) <{third}>' }

    it { should be_a Hash }
  end

  describe "Excise convenience method" do
    subject { Excise(string, pattern) }
    let(:string)  { '[first]' }
    let(:pattern) { '[{first}]' }

    it { should be_a Hash }
  end
end
