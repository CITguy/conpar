require 'spec_helper'

describe Conpar do
  describe ".configure" do
    context "yielded value" do
      it "should be the same object asa .config()" do
        yielded = nil
        Conpar.configure { |c| yielded = c }
        expect(yielded).to eq(Conpar.config)
      end
    end
  end

  describe ".config" do
    subject { Conpar.config }
    it "should be a Conpar::Configuration object" do
      expect(subject).to be_a_kind_of(Conpar::Configuration)
    end
  end
end
