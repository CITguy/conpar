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
        it { expect(result.select{|r| r.ilk == :comment }).to have(2).items }
        context "ACLs" do
          let(:acls) do
            result.select{|r| r.ilk == :access_list }
          end
          it { expect(acls).to have(1).item }
          it "first acl should be on line #3" do
            expect(acls.first.line_number).to eq(3)
          end
        end
        # f
      end
    end

    # 2 comments and 2 different ACLs
    context 'sample3' do
      let(:config) { File.read("spec/samples/sample3") }

      context "result" do
        let(:result) { subject.parse(config) }
        it { expect(result.select{|r| r.ilk == :comment }).to have(2).items }
        it { expect(result.select{|r| r.ilk == :access_list }).to have(2).items }
        it { expect(result.select{|r| r.sub_ilk == "standard" }).to have(1).items }
        it { expect(result.select{|r| r.sub_ilk == "extended" }).to have(1).items }
      end
    end

    # 2 comments, 2 different known ACLs, 1 unknown ACL
    context 'sample4' do
      let(:config) { File.read("spec/samples/sample4") }

      context "result" do
        let(:result) { subject.parse(config) }
        it { expect(result.select{|r| r.ilk == :comment }).to have(2).items }
        it { expect(result.select{|r| r.ilk == :access_list }).to have(3).items }
        it { expect(result.select{|r| r.sub_ilk == "standard" }).to have(1).items }
        it { expect(result.select{|r| r.sub_ilk == "extended" }).to have(1).items }
        it { expect(result.select{|r| r.sub_ilk == "unknown" }).to have(1).items }
      end
    end

    # 3 comments, 2 different known ACLs, 1 unknown ACL, 2 other directives
    context 'sample5' do
      let(:config) { File.read("spec/samples/sample5") }

      context "result" do
        let(:result) { subject.parse(config) }
        it { expect(result.select{|r| r.ilk == :comment }).to have(3).items }
        it { expect(result.select{|r| r.ilk == :access_list }).to have(3).items }
        it { expect(result.select{|r| r.sub_ilk == "standard" }).to have(1).items }
        it { expect(result.select{|r| r.sub_ilk == "extended" }).to have(1).items }
        it { expect(result.select{|r| r.sub_ilk == "unknown" }).to have(1).items }
        it { expect(result.select{|r| r.ilk == :directive }).to have(2).items }
      end
    end

    # 4 comments, 3 different known ACLs, 1 unknown ACL, 2 other directives
    context 'sample5' do
      let(:config) { File.read("spec/samples/sample6") }

      context "result" do
        let(:result) { subject.parse(config) }
        it { expect(result.select{|r| r.ilk == :comment }).to have(4).items }
        it { expect(result.select{|r| r.ilk == :access_list }).to have(4).items }
        it { expect(result.select{|r| r.sub_ilk == "standard" }).to have(1).items }
        it { expect(result.select{|r| r.sub_ilk == "extended" }).to have(2).items }
        it { expect(result.select{|r| r.sub_ilk == "unknown" }).to have(1).items }
        it { expect(result.select{|r| r.ilk == :directive }).to have(2).items }
      end
    end
  end
end
