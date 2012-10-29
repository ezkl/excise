require "spec_helper"

module Excise
  describe "Base" do
    context 'only a pattern' do
      let(:base) { Base.new(pattern) }
      let(:pattern) { '[{first}]' }
      let(:string)  { '[value]' }

      it "should parse strings" do
        base.parse(string).should be_a Hash
      end
    end

    context 'pattern and string' do
      subject       { Base.new(pattern).parse(string) }

      let(:string)  { '[this] (patterned) <STRING>' }
      let(:pattern) { '[{first}] ({second}) <{third}>' }

      it           { should be_a Hash }
      its(:keys)   { should eq [:first, :second, :third] }
      its(:values) { should eq ['this', 'patterned', 'STRING'] }
    end

    describe '#parse' do
      let(:pattern) { Base.new('[{first}]') }
      it "should take a string and parse it" do
        output = pattern.parse('[value]')
        output.should eq Hash[{first: 'value'}]

        output = pattern.parse('[other]')
        output.should eq Hash[{first: 'other'}]
      end
    end
  end
end
