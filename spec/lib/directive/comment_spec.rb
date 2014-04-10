require 'spec_helper'

describe Conpar::Directive::Comment do
  context "::SIGNATURE" do
    subject { Conpar::Directive::Comment::SIGNATURE }
    it "should match ': no comment'" do
      expect(": no comment").to match(subject)
    end
    it "should not match empty string" do
      expect(" ").not_to match(subject)
    end
  end
end
