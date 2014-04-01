require 'spec_helper'

describe NodeDecorator do
  let(:node) { double('node') }
  subject { NodeDecorator.new(node).send(method_name) }

  describe '.link' do
    let(:method_name) { :link }
    before do
      allow(node).to receive(:title).and_return('Title')
      allow(node).to receive(:url).and_return('http://example.com')
    end

    it { expect(subject).to eq("<a href=\"http://example.com\" target=\"_blank\">Title</a>") }
  end

  describe '.host' do
    let(:method_name) { :host }
    before do
      allow(node).to receive(:url).and_return('http://example.com/article/1')
    end

    it { expect(subject).to eq('example.com') }
  end

  describe '.site' do
    let(:method_name) { :site }
    before { allow(node).to receive(:site_id).and_return('SITE_ID') }
    it { expect(subject).to eq("<a href=\"http://test.host/?query=sites+where+_id+%3D+%22SITE_ID%22\">site</a>") }
  end
end
