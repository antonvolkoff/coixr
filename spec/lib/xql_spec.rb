require 'spec_helper'

describe XQL do
  subject { XQL.parse(query) }

  context 'when full query is given' do
    let(:query) { 'articles where author = "John"' }

    it { expect(subject).to eq({_type: "Article", author: "John"}) }
  end
end