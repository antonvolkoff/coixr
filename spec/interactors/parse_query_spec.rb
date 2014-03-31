require 'spec_helper'

describe ParseQuery do
  let(:xql_module)  { double('XQL') }
  let(:query)       { 'search query' }
  subject { ParseQuery.perform(params: {query: query}, xql_module: xql_module) }


  context 'when parser is successful' do
    before { allow(xql_module).to receive(:parse).with(query).and_return('ast') }

    it { expect(subject.success?).to eq(true) }
    it { expect(subject.conditions).to eq('ast') }  
  end

  context 'when parser is failed' do
    before { allow(xql_module).to receive(:parse).with(query).and_raise('ERROR') }

    it { expect(subject.success?).to eq(false) }
    it { expect(subject.message).to eq('Sorry, query is wrong') }
  end
end