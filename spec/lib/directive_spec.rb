require 'spec_helper'

describe Conpar::Directive do
  context ".new" do
    it "should always return a type of Directive" do
      expect(subject.new("").class.ancestors).to include(Conpar::Directive::Base)
    end
  end
end
