# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Inquisition::BaseConfig, type: :unit do
  subject { Inquisition::BaseConfig }
  before { stub_const('Inquisition::BaseConfig::TARGET_DIRECTORY', temp_folder) }
  after { remove_base_config }

  describe '#initialize_config' do
    before { subject.initialize_config }

    it { expect(File).to exist(base_config_file) }
  end

  describe '#config_exist?' do
    context 'when config file exist' do
      before { create_base_config }

      it 'return true' do
        expect(subject.config_exist?).to be_truthy
      end
    end

    context 'when config file not exist' do
      it 'return false' do
        expect(subject.config_exist?).to be_falsey
      end
    end
  end

  describe '#config_enabled?' do
    before { create_base_config }

    context 'when config enabled' do
      it 'return true' do
        expect(subject.config_enabled?(:linters, :backend)).to be_truthy
      end
    end

    context 'when config not enabled or not exist' do
      it 'return false' do
        expect(subject.config_enabled?(:linters, :bundler_audit)).to be_falsey
        expect(subject.config_enabled?(:linters, :unknow_linter)).to be_falsey
      end
    end
  end
end
