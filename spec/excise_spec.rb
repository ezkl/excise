require 'spec_helper'

describe Excise do
  context 'patterned string' do
    subject       { Excise(string, pattern) }
    let(:string)  { '[this] patterned <STRING>' }
    let(:pattern) { '[{first}] {second} <{third}>' }

    it           { should be_a Hash }
    its(:keys)   { should eq ['first', 'second', 'third'] }
    its(:values) { should eq ['this', 'patterned', 'STRING'] }
  end
end
