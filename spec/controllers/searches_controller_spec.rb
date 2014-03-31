require 'spec_helper'

describe SearchesController do
  describe '#index' do
    subject { get :index }
    it { expect(subject).to render_template('searches/index') }
  end

  describe '#index' do
    let(:result) { double('result', success?: success, nodes: nodes, message: message) }
    subject { get :index, :query => 'query', page: 1, format: :js }
    before { allow(Search).to receive(:perform).and_return(result) }

    context 'when search is success' do
      let(:success) { true }
      let(:nodes)   { ['node1', 'node2'] }
      let(:message) { nil }
      
      it 'assigns @nodes' do
        subject
        expect(assigns(:nodes)).to eq(nodes)
      end
    end

    context 'when search is failed' do
      let(:success) { false }
      let(:nodes)   { nil }
      let(:message) { 'ERROR' }
      
      it 'does not assign @nodes' do
        subject
        expect(assigns(:nodes)).to eq(nil)
      end

      it 'assigns @message' do
        subject
        expect(assigns(:message)).to eq('ERROR')
      end
    end 
  end
end
