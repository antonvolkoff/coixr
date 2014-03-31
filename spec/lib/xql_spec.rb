require 'spec_helper'

describe XQL do
  subject { XQL.parse(query) }

  context 'when query with one condition' do
    let(:query) { 'articles where author = "John"' }

    it { expect(subject).to eq({_type: "Article", author: "John"}) }
  end

  context 'when simple query' do
    let(:query) { 'articles' }

    it { expect(subject).to eq({_type: "Article"}) }
  end
end