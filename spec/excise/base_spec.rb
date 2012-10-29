require "spec_helper"

module Excise
  describe "Base" do
    context 'patterned string' do
      subject       { Base.new(string, pattern).parse }

      let(:string)  { '[this] (patterned) <STRING>' }
      let(:pattern) { '[{first}] ({second}) <{third}>' }

      it           { should be_a Hash }
      its(:keys)   { should eq [:first, :second, :third] }
      its(:values) { should eq ['this', 'patterned', 'STRING'] }
    end
  end
end
