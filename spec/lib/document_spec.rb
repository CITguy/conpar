require 'spec_helper'

describe Conpar::Document do
  subject { Conpar::Document }

  it "should respond to #parse()" do
    expect(subject).to respond_to(:parse)
  end

  describe ".parse" do
    # 3 comments, nothing else
    context "basic" do
      let(:config) { File.read("spec/samples/basic") }

      it "should read as a string" do
        expect(config).to be_a_kind_of(String)
      end

      context "result" do
        context "valid parse" do
          let(:result) { subject.parse(config) }
          it "should be an Array" do
            expect(result).to be_a_kind_of(Array)
          end
        end#valid parse

        context "invalid parse" do
          it "should throw exception if fw_config argument is not a string" do
            expect{ subject.parse(nil) }.to raise_exception(ArgumentError)
            expect{ subject.parse(Object.new) }.to raise_exception(ArgumentError)
          end
        end#invalid parse
      end#result
    end

    # 2 comments and 1 ACL
    context 'sample2' do
      let(:config) { File.read("spec/samples/sample2") }

      context "result" do
        let(:result) { subject.parse(config) }
        it { expect(result.select{|r| r.ilk == :comment }.size).to eq(2) }
        context "ACLs" do
          let(:acls) do
            result.select{|r| r.ilk == :access_list }
          end
          it { expect(acls.size).to eq(1) }
          it "first acl should be on line #3" do
            expect(acls.first.line_number).to eq("3")
          end
        end
        # f
      end

      context "as UTF-8 encoding" do
        let(:content) { config.encode("UTF-8") }
        context "result" do
          let(:result) { subject.parse(content) }
          it "line_number encodings should all be same as content encoding" do
            encodings = result.collect{|r| r.line_number.to_s.encoding }
            encodings &= encodings
            expect(encodings).to eq([content.encoding])
          end
        end
      end
    end

    # 2 comments and 2 different ACLs
    context 'sample3' do
      let(:config) { File.read("spec/samples/sample3") }

      context "result" do
        let(:result) { subject.parse(config) }
        it { expect(result.select{|r| r.ilk == :comment }.size).to eq(2) }
        it { expect(result.select{|r| r.ilk == :access_list }.size).to eq(2) }
        it { expect(result.select{|r| r.sub_ilk == "standard" }.size).to eq(1) }
        it { expect(result.select{|r| r.sub_ilk == "extended" }.size).to eq(1) }
      end
    end

    # 2 comments, 2 different known ACLs, 1 unknown ACL
    context 'sample4' do
      let(:config) { File.read("spec/samples/sample4") }

      context "result" do
        let(:result) { subject.parse(config) }
        it { expect(result.select{|r| r.ilk == :comment }.size).to eq(2) }
        it { expect(result.select{|r| r.ilk == :access_list }.size).to eq(3) }
        it { expect(result.select{|r| r.sub_ilk == "standard" }.size).to eq(1) }
        it { expect(result.select{|r| r.sub_ilk == "extended" }.size).to eq(1) }
        it { expect(result.select{|r| r.sub_ilk == "unknown" }.size).to eq(1) }
      end
    end

    # 3 comments, 2 different known ACLs, 1 unknown ACL, 2 other directives
    context 'sample5' do
      let(:config) { File.read("spec/samples/sample5") }

      context "result" do
        let(:result) { subject.parse(config) }
        it { expect(result.select{|r| r.ilk == :comment }.size).to eq(3) }
        it { expect(result.select{|r| r.ilk == :access_list }.size).to eq(3) }
        it { expect(result.select{|r| r.sub_ilk == "standard" }.size).to eq(1) }
        it { expect(result.select{|r| r.sub_ilk == "extended" }.size).to eq(1) }
        it { expect(result.select{|r| r.sub_ilk == "unknown" }.size).to eq(1) }
        it { expect(result.select{|r| r.ilk == :directive }.size).to eq(2) }
      end
    end

    # 4 comments, 3 different known ACLs, 1 unknown ACL, 2 other directives
    context 'sample5' do
      let(:config) { File.read("spec/samples/sample6") }

      context "result" do
        let(:result) { subject.parse(config) }
        it { expect(result.select{|r| r.ilk == :comment }.size).to eq(4) }
        it { expect(result.select{|r| r.ilk == :access_list }.size).to eq(4) }
        it { expect(result.select{|r| r.sub_ilk == "standard" }.size).to eq(1) }
        it { expect(result.select{|r| r.sub_ilk == "extended" }.size).to eq(2) }
        it { expect(result.select{|r| r.sub_ilk == "unknown" }.size).to eq(1) }
        it { expect(result.select{|r| r.ilk == :directive }.size).to eq(2) }
      end
    end

    context "~legacy syntax~" do
      # 2 comments and 1 ACL
      context 'legacy-sample1' do
        let(:config) { File.read("spec/samples/legacy-sample1") }

        context "result" do
          let(:result) { subject.parse(config) }
          it { expect(result.select{|r| r.ilk == :comment }.size).to eq(2) }
          it { expect(result.select{|r| r.ilk == :access_list }.size).to eq(1) }
          it { expect(result.select{|r| r.sub_ilk == "extended" }.size).to eq(1) }
        end
      end#legacy-sample1
    end


    context "with invalid UTF-8 characters" do
      let(:config) { ": some comment\255" }
      it "shouldn't error"
    end
  end
end
