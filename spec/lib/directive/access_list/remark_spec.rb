require 'spec_helper'

describe Conpar::Directive::AccessList::Remark do
  let(:klass) { Conpar::Directive::AccessList::Remark }
  let(:remark) { "access-list 101 remark ***Some Remark***" }

  context "::SIGNATURE" do
    it "should match 'access-list 101 remark ***Some Remark***'" do
      expect(remark).to match(klass::SIGNATURE)
    end
  end

  context "#new" do
    subject { klass.new(remark) }
    [ :name, :type, :remark ].each do |m|
      it "should respond to #{m}" do
        expect(subject).to respond_to(m)
      end
    end
    it ".sub_ilk should be 'remark'" do
      expect(subject.sub_ilk).to eq("remark")
    end
    it ".name should be '101'" do
      expect(subject.name).to eq("101")
    end
    it ".type should be 'remark'" do
      expect(subject.type).to eq("remark")
    end
    it ".remark should be '***Some Remark***'" do
      expect(subject.remark).to eq("***Some Remark***")
    end
  end
end
