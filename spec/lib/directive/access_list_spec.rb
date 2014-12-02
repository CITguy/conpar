require 'spec_helper'

describe Conpar::Directive::AccessList do
  context ".new" do
    {
      "access-list foo standard deny all"    => Conpar::Directive::AccessList::Standard,
      "access-list foo extended deny all"    => Conpar::Directive::AccessList::Extended,
      "access-list foo webtype deny all"     => Conpar::Directive::AccessList::WebType,
      "access-list foo ethertype deny all"   => Conpar::Directive::AccessList::EtherType,
      "access-list foo unknowntype deny all" => Conpar::Directive::AccessList::Base,
      "access-list 101 extended permit ip any any object-group standard" => Conpar::Directive::AccessList::Extended,
      "access-list 101 permit ip any any" => Conpar::Directive::AccessList::Extended # Legacy Syntax
    }.each do |line, klass_output|
      it "for '#{line}' should return a #{klass_output.name}" do
        expect(subject.new(line)).to be_a_kind_of(klass_output)
      end
    end
  end
end
