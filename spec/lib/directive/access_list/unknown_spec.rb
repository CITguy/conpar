require 'spec_helper'

describe Conpar::Directive::AccessList::UnknownType do
  let(:klass) { Conpar::Directive::AccessList::UnknownType }
  it "should have correct sub_ilk" do
    expect(klass.new("access-list foo unknowntype permit all").sub_ilk).to eq("unknown")
  end
end
