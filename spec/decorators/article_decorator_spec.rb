require 'spec_helper'

describe ArticleDecorator do
  let(:article) { double('article') }
  subject { ArticleDecorator.new(article).send(method_name) }

  describe '.queries' do
    let(:method_name) { :queries }
    it { expect(subject).to eq([:id, :site, :author]) }
  end

  describe '.id' do
    let(:method_name) { :id }
    before { allow(article).to receive(:id).and_return('ID') }
    it { expect(subject).to eq("<a href=\"http://test.host/?query=articles+where+_id+%3D+%22ID%22\">id</a>") }
  end

  describe '.author' do
    let(:method_name) { :author }
    context 'when author exists' do
      before { allow(article).to receive(:author_id).and_return('AUTHOR') }
      it { expect(subject).to eq("<a href=\"http://test.host/?query=profiles+where+_id+%3D+%22AUTHOR%22\">author</a>") }
    end

    context 'when author does not exist' do
      before { allow(article).to receive(:author_id).and_return(nil) }
      it { expect(subject).to eq(nil) }
    end
  end
end