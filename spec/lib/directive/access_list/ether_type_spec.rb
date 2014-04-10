require 'spec_helper'

describe Conpar::Directive::AccessList::EtherType do
  let(:klass) { Conpar::Directive::AccessList::EtherType }
  {
    "access-list NONIP ethertype permit bpdu" => {
     name: "NONIP",
     permission: "permit",
     rule: "bpdu"
    },
    "access-list ETHER ethertype permit ipx" => {
      name: "ETHER",
      permission: "permit",
      rule: "ipx",
    },
  }.each do |conf,attrs|
    it "::SIGNATURE should match '#{conf}'" do
      expect(conf).to match(klass::SIGNATURE)
    end
    context "for config line '#{conf}'" do
      subject { klass.new(conf) }
      it ".sub_ilk should be 'ethertype'" do
        expect(subject.sub_ilk).to eq("ethertype")
      end
      attrs.each do |k,v|
        it ".#{k} should be '#{v || 'nil'}'" do
          expect(subject.send(k)).to eq(v)
        end
      end#attrs
    end#context
  end
end
