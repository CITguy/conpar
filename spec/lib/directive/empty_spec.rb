require 'spec_helper'

describe Conpar::Directive::Empty do
  context "::SIGNATURE" do
    subject { Conpar::Directive::Empty::SIGNATURE }
    it "should match ''" do
      expect("").to match(subject)
    end
    it "should match '    '" do
      expect("    ").to match(subject)
    end
  end
end
