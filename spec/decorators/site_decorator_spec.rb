require 'spec_helper'

describe SiteDecorator do
  let(:site) { double('site') }
  subject { SiteDecorator.new(site).send(method_name) }

  describe '.queries' do
    let(:method_name) { :queries }
    it { expect(subject).to eq([:id, :authors, :articles]) }
  end

  describe '.id' do
    let(:method_name) { :id }
    before { allow(site).to receive(:id).and_return('ID') }
    it { expect(subject).to eq("<a href=\"http://test.host/?query=sites+where+_id+%3D+%22ID%22\">id</a>") }
  end

  describe '.authors' do
    let(:method_name) { :authors }
    before { allow(site).to receive(:id).and_return('ID') }
    it { expect(subject).to eq("<a href=\"http://test.host/?query=profiles+where+site_id+%3D+%22ID%22\">authors</a>") }
  end

  describe '.articles' do
    let(:method_name) { :articles }
    before { allow(site).to receive(:id).and_return('ID') }
    it { expect(subject).to eq("<a href=\"http://test.host/?query=articles+where+site_id+%3D+%22ID%22\">articles</a>") }
  end
end