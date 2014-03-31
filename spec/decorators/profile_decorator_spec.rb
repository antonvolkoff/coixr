require 'spec_helper'

describe ProfileDecorator do
  let(:profile) { double('profile') }
  subject { ProfileDecorator.new(profile).send(method_name) }

  describe '.queries' do
    let(:method_name) { :queries }
    it { expect(subject).to eq([:id, :articles]) }
  end

  describe '.id' do
    let(:method_name) { :id }
    before { allow(profile).to receive(:id).and_return('ID') }
    it { expect(subject).to eq("<a href=\"http://test.host/?query=profiles+where+_id+%3D+%22ID%22\">id</a>") }
  end

  describe '.articles' do
    let(:method_name) { :articles }
    before { allow(profile).to receive(:url).and_return('URL') }
    it { expect(subject).to eq("<a href=\"http://test.host/?query=articles+where+author+%3D+%22URL%22\">articles</a>")}
  end
end