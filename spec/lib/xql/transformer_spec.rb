require 'spec_helper'

describe XQL::Transformer do
  subject { XQL::Transformer.new.apply(tree) }

  describe 'string' do
    let(:tree) { {:string => "a string"} }
    it { expect(subject).to eq("a string")  }
  end

  describe 'integer' do
    let(:tree) { {:integer => "1"} }
    it { expect(subject).to eq(1) }
  end

  describe 'float' do
    let(:tree) { {:float => "3.14"} }
    it { expect(subject).to eq(3.14) }
  end

  describe 'boolean' do
    let(:tree) { {:boolean => "true"} }
    it { expect(subject).to eq(true) }
  end

  describe 'condition' do
    let(:tree) { {:key => 'author', :value => "John"} }
    it { expect(subject).to eq({:author => "John"}) }
  end

  describe 'type and condition' do
    let(:tree) { {:type => "articles", :condition => {:key => "value"}} }
    it { expect(subject).to eq({_type: "Article", key: "value"}) }
  end
end