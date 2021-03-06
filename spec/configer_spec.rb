# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Inquisition::Configure, type: :unit do

  describe '#call' do
    subject { Inquisition::Configure.call }

    context 'when authenticate configure' do
      before do
        allow(Inquisition::BaseConfig).to receive(:config_exist?).and_return(true)
        allow(Inquisition::BaseConfig).to receive(:config_enabled?).and_return(false)
      end

      context 'when backend configurers are enabled' do
        before do
          allow(Inquisition::BaseConfig).to receive(:config_enabled?).with(:linters, :backend).and_return(true)
        end

        it_behaves_like 'call callable objects', Inquisition::Auditors::Backend::Installer => 'backend configure'
      end

      context 'when frontend configurers are enabled' do
        before do
          allow(Inquisition::BaseConfig).to receive(:config_enabled?).with(:linters, :frontend).and_return(true)
        end

        it_behaves_like 'call callable objects', Inquisition::Auditors::Frontend::Installer => 'frontend configure'
      end

      context 'when common configurers are enabled' do
        before do
          allow(Inquisition::BaseConfig).to receive(:config_enabled?).with(:linters, :common).and_return(true)
        end

        it_behaves_like 'call callable objects', Inquisition::Auditors::Common::Installer => 'common configure'
      end
    end

    context 'when configure was not authenticate' do
      before do
        allow(Inquisition::BaseConfig).to receive(:config_exist?).and_return(false)
      end

      it 'raise authenticate error' do
        expect{ subject.call }.to raise_error(Inquisition::Errors::BaseConfigAbsenseError)
      end
    end
  end
end
