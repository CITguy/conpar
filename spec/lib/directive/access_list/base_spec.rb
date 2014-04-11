require 'spec_helper'

describe Conpar::Directive::AccessList::Base do
  let(:klass) { Conpar::Directive::AccessList::Base }

  context "#to_s" do
    it "should be same as #content" do
      obj = klass.new("foobar")
      expect(obj.to_s).to eq(obj.content)
    end
  end
end
