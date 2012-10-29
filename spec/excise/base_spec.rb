require "spec_helper"

module Excise
  describe "Base" do
    context 'only a pattern' do
      let(:base) { Base.new(pattern) }
      let(:pattern) { '[{first}]' }

      it "should parse strings" do
        base.string = '[value]'
        base.parse.should be_a Hash
      end
    end

    context 'pattern and string' do
      subject       { Base.new(pattern, string).parse }

      let(:string)  { '[this] (patterned) <STRING>' }
      let(:pattern) { '[{first}] ({second}) <{third}>' }

      it           { should be_a Hash }
      its(:keys)   { should eq [:first, :second, :third] }
      its(:values) { should eq ['this', 'patterned', 'STRING'] }
    end

    describe '#parse_string' do
      let(:pattern) { Base.new('[{first}]') }
      it "should take a string and parse it" do
        output = pattern.parse_string('[value]')
        output.should eq Hash[{first: 'value'}]

        output = pattern.parse_string('[other]')
        output.should eq Hash[{first: 'other'}]
      end
    end
  end
end
