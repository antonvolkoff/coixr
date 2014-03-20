require 'spec_helper'

describe XQL::Parser do
  subject { XQL::Parser.new.parse(xql) } 

  context 'when <category>' do
    let(:xql) { "articles" }
    let(:result) { {category: "articles"} }
    it { expect(subject).to eq(result) }
  end

  context 'when <category where condition>' do
    let(:xql) { "articles where author = \"John\"" }
    let(:result) { {category: "articles", conditions: "author = \"John\""} }

    it { expect(subject).to eq(result) }
  end
end