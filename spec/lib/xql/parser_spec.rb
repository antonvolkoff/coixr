require 'spec_helper'

describe XQL::Parser do
  subject { XQL::Parser.new.send(rule) }

  describe 'rule integer' do
    let(:rule) { :integer }

    it { expect(subject).to      parse('1') }
    it { expect(subject).to      parse('-123') }
    it { expect(subject).to      parse('120381') }
    it { expect(subject).to      parse('181') }
    it { expect(subject).to_not  parse('0181') }
  end

  describe 'rule float' do
    let(:rule) { :float }

    it { expect(subject).to      parse('0.1') }
    it { expect(subject).to      parse('3.14159') }
    it { expect(subject).to      parse('-0.00001') }
    it { expect(subject).to      parse('12.3456') }
    it { expect(subject).not_to  parse('.1') }
  end

  describe 'rule boolean' do
    let(:rule) { :boolean }

    it { expect(subject).to      parse('true') }
    it { expect(subject).to      parse('false') }
    it { expect(subject).not_to  parse('truefalse') }
  end

  describe 'rule string' do
    let(:rule) { :string }

    it { expect(subject).to      parse('""') }
    it { expect(subject).to      parse('" hello World!"') }
    it { expect(subject).not_to  parse('"stringggg') }
  end

  describe 'rule value' do
    let(:rule) { :value }

    it { expect(subject).to parse('-42') }
    it { expect(subject).to parse('3.14') }
    it { expect(subject).to parse('true') }
    it { expect(subject).to parse('"Mega String"') }
  end

  describe 'rule key' do
    let(:rule) { :key }

    it { expect(subject).to     parse('foobar') }
    it { expect(subject).not_to parse("lolwhat.noWAY") }
    it { expect(subject).not_to parse('no whitespace') }
    it { expect(subject).not_to parse('noequal=thing') }
  end

  describe 'rule condition' do
    let(:rule) { :condition }

    it { expect(subject).to parse('key=3.14') }
    it { expect(subject).to parse('key = 10') }
    it { expect(subject).to parse('key = 10.12') }
    it { expect(subject).to parse('key = true') }
    it { expect(subject).to parse('key = "value"') }
  end

  describe 'rule query' do
    let(:rule) { :query }

    it { expect(subject).to parse('articles where author = "John"') }
    it { expect(subject).to parse('   art where color = "red"') }
    it { expect(subject).to parse('articles') }
  end

  describe '.parse' do
    subject { XQL::Parser.new.parse(query) }

    context 'when query is "articles"' do
      let(:query) { 'articles' }

      it { expect(subject).to eq type: 'articles' }
    end

    context 'when query is "articles where author = "John""' do
      let(:query) { 'articles where author = "John"' }

      it { expect(subject).to eq(
        type: 'articles', 
        condition: {
          key: 'author', value: {
            string: 'John'}}) }
    end
  end
end