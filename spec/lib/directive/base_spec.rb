require 'spec_helper'

describe Conpar::Directive::Base do
  context "::SIGNATURE" do
    subject { Conpar::Directive::Base::SIGNATURE }
    it "should not be nil" do
      expect(subject).to_not be_nil, "::SIGNATURE is nil"
    end
    it "should be a Regexp" do
      expect(subject).to be_a_kind_of(Regexp)
    end
  end

  context "new instance" do
    subject { Conpar::Directive::Base.new }

    it "should not have a line number" do
      expect(subject.line_number).to be_nil
    end

    it "should have a line span of 1" do
      expect(subject.line_span).to eq(1)
    end

    it "should have no content" do
      expect(subject.content).to eq("")
    end

    it "should have an empty sub_ilk" do
      expect(subject.sub_ilk).to eq("")
    end

    it ".match_data should be nil" do
      expect(subject.match_data).to be_nil
    end

    context 'with explicit content' do
      subject { Conpar::Directive::Base.new("foobar") }
      context ".content" do
        it "should be 'foobar'" do
          expect(subject.content).to eq('foobar')
        end
      end
    end
  end
end
