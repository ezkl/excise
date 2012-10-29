require "spec_helper"

module Excise
  describe "Base" do
    context 'only a pattern' do
      subject { Base.new(pattern) }
      let(:pattern) { '[{first}]' }
    end

    context 'pattern and string' do
      subject       { Base.new(pattern, string).parse }

      let(:string)  { '[this] (patterned) <STRING>' }
      let(:pattern) { '[{first}] ({second}) <{third}>' }

      it           { should be_a Hash }
      its(:keys)   { should eq [:first, :second, :third] }
      its(:values) { should eq ['this', 'patterned', 'STRING'] }
    end
  end
end
