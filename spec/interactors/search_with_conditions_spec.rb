require 'spec_helper'

describe SearchWithConditions do
  let(:node_class) { double('Node') }
  let(:conditions) { {_type: 'Test'} }
  let(:params)     { {page: 1} }
  let(:records)    { double('records') }
  subject do 
    SearchWithConditions.perform(conditions: conditions, node_class: node_class,
      params: params)
  end
  before do 
    allow(node_class).to receive(:where).with(conditions).and_return(records)
    allow(records).to receive(:page).with(1).and_return(nodes)
  end

  context 'when search is successful' do
    let(:nodes) { [FactoryGirl.build(:node)] }

    it { expect(subject.success?).to eq(true) }
    it { expect(subject.nodes).to be_decorated }
  end

  context 'when search is failed' do
    let(:nodes) { [] }

    it { expect(subject.success?).to eq(false) }
    it { expect(subject.nodes).to eq([]) }
  end
end