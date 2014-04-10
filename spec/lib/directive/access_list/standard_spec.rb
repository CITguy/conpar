require 'spec_helper'

describe Conpar::Directive::AccessList::Standard do
  let(:klass) { Conpar::Directive::AccessList::Standard }
  {
    "access-list OSPF standard permit 192.168.1.0 255.255.255.0" => {
      name: "OSPF",
      permission: "permit",
      rule: "192.168.1.0 255.255.255.0"
    },
    "access-list foo standard permit 192.168.1.50 255.255.255.0" => {
      name: "foo",
      permission: "permit",
      rule: "192.168.1.50 255.255.255.0"
    }
  }.each do |conf, attrs|
    it "::SIGNATURE should match '#{conf}'" do
      expect(conf).to match(klass::SIGNATURE)
    end
    context "for config line '#{conf}'" do
      subject { klass.new(conf) }
      it ".sub_ilk should be 'standard'" do
        expect(subject.sub_ilk).to eq('standard')
      end
      attrs.each do |k,v|
        it ".#{k} should be '#{v || 'nil'}'" do
          expect(subject.send(k)).to eq(v)
        end
      end#attrs
    end#context
  end#hash
end
