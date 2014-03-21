require 'spec_helper'

describe XQL::Parser do
  subject { XQL::Parser.new.send(rule) }

  describe 'value' do
    let(:rule) { :value }

    it "parses integers" do
      expect(subject).to      parse("1")
      expect(subject).to      parse("-123")
      expect(subject).to      parse("120381")
      expect(subject).to      parse("181")
      expect(subject).to_not  parse("0181")
    end

    it "parses floats" do
      expect(subject).to      parse("0.1")
      expect(subject).to      parse("3.14159")
      expect(subject).to      parse("-0.00001")
      expect(subject).to      parse("12.3456")
      expect(subject).to_not  parse(".1")
    end

    it "parses booleans" do
      expect(subject).to      parse("true")
      expect(subject).to      parse("false")
      expect(subject).to_not  parse("truefalse")
    end

    it 'parses strings' do
      expect(subject).to      parse('""')
      expect(subject).to      parse('"hello world"')
    end
  end

  describe 'key' do
    let(:rule) { :key }

    it { expect(subject).to     parse('foobar') }
    it { expect(subject).not_to parse("lolwhat.noWAY") }
    it { expect(subject).not_to parse('no whitespace') }
    it { expect(subject).not_to parse('noequal=thing') }
  end

  describe 'condition' do
    let(:rule) { :condition }

    it { expect(subject).to parse('key=3.14') }
    it { expect(subject).to parse('key = 10') }
    it { expect(subject).to parse('key = 10.12') }
    it { expect(subject).to parse('key = true') }
    it { expect(subject).to parse('key = "value"') }
  end
end