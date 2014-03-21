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
end