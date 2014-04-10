require 'spec_helper'

describe Conpar::Directive::AccessList::WebType do
  let(:klass) { Conpar::Directive::AccessList::WebType }
  {
    "access-list acl_company webtype deny url http://*.cisco.example" => {
      name: "acl_company",
      permission: "deny",
      rule: "url http://*.cisco.example"
    }
  }.each do |conf,attrs|
    it "::SIGNATURE should match '#{conf}'" do
      expect(conf).to match(klass::SIGNATURE)
    end
    context "for config line '#{conf}'" do
      subject { klass.new(conf) }
      it ".sub_ilk should be 'webtype'" do
        expect(subject.sub_ilk).to eq('webtype')
      end
      attrs.each do |k,v|
        it ".#{k} should be '#{v || 'nil'}'" do
          expect(subject.send(k)).to eq(v)
        end
      end#attrs
    end#context
  end
end
