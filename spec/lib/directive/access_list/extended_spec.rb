require 'spec_helper'

describe Conpar::Directive::AccessList::Extended do
  let(:klass) { Conpar::Directive::AccessList::Extended }
  {
    # example from cisco documenation
    # rule any any
    "access-list ACL_IN extended permit ip any any" => {
      name: "ACL_IN", line: nil,
      permission: "permit", protocol: "ip",
      rule:"any any"
    },
    # Rule contains more than two object-group statements
    "access-list foo extended permit tcp object-group OBJGRP1 object-group OBJGRP2 object-group OBJGRP3" => {
      name: "foo", line: nil,
      permission: "permit", protocol: "tcp",
      rule:"object-group OBJGRP1 object-group OBJGRP2 object-group OBJGRP3"
    },
    # rule contains object-group BLAH to any
    "access-list bar extended permit ip object-group OBJGRP1 any" => {
      name: "bar", line: nil,
      permission: "permit", protocol: "ip",
      rule:"object-group OBJGRP1 any"
    },
    # rule ip mask any
    "access-list bang extended permit ip 10.1.1.0 255.255.255.240 any" => {
      name: "bang", line: nil,
      permission: "permit", protocol: "ip",
      rule:"10.1.1.0 255.255.255.240 any"
    },
    # rule host ip any
    "access-list biz extended permit ip host 192.168.1.50 any" => {
      name: "biz", line: nil,
      permission: "permit", protocol: "ip",
      rule:"host 192.168.1.50 any"
    },
    # rule ip mask to ip mask
    "access-list nonat extended deny ip 10.9.8.7 255.255.255.0 7.8.9.10 255.255.255.0" => {
      name: "nonat", line: nil,
      permission: "deny", protocol: "ip",
      rule:"10.9.8.7 255.255.255.0 7.8.9.10 255.255.255.0"
    },
    # rule with line number
    "access-list foo line 16 extended permit ip any any" => {
      name: "foo", line: "16",
      permission: "permit", protocol: "ip",
      rule: "any any"
    }
  }.each do |conf, attrs|
    it "::SIGNATURE should match '#{conf}'" do
      expect(conf).to match(klass::SIGNATURE)
    end
    context "for config def '#{conf}'" do
      subject { klass.new(conf) }
      it ".sub_ilk should be 'extended'" do
        expect(subject.sub_ilk).to eq("extended")
      end
      attrs.each do |k,v|
        it ".#{k} should be '#{v || 'nil'}'" do
          expect(subject.send(k)).to eq(v)
        end
      end#attrs
      context "with explicit line_number as #new argument" do
        subject { klass.new(conf, line_number: 42) }
        it ".line_number should be 42" do
          expect(subject.line_number).to eq(42)
        end
      end
    end#context
  end#hash
end
