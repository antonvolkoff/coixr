require 'spec_helper'

describe SearchWithConditions do
  let(:node_class) { double('Node') }
  let(:conditions) { {_type: 'Test'} }
  subject do 
    SearchWithConditions.perform(conditions: conditions, node_class: node_class)
  end
  before do 
    allow(node_class).to receive(:where).with(conditions).and_return(nodes)
  end

  context 'when seach is successful' do
    let(:nodes) { ['node'] }

    it { expect(subject.success?).to eq(true) }
    it { expect(subject.nodes).to eq(['node']) }
  end

  context 'when search is failed' do
    let(:nodes) { [] }

    it { expect(subject.success?).to eq(false) }
    it { expect(subject.nodes).to eq([]) }
  end
end