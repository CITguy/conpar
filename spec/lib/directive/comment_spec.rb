require 'spec_helper'

describe Conpar::Directive::Comment do
  let(:klass) { Conpar::Directive::Comment }

  context "::SIGNATURE" do
    it "should match ': no comment'" do
      expect(": no comment").to match(klass::SIGNATURE)
    end
    it "should not match empty string" do
      expect(" ").not_to match(klass::SIGNATURE)
    end
  end
  context "valid comment" do
    subject { klass.new(": no comment") }
    it ".ilk should be :comment" do
      expect(subject.ilk).to eq(:comment)
    end
    it ".sub_ilk should be 'comment'" do
      expect(subject.sub_ilk).to eq("comment")
    end
  end
end
