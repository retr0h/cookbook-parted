# encoding: UTF-8

require_relative 'spec_helper'

describe 'parted::_test' do
  before { stub_command(/.*/) }
  let(:chef_run) do
    ChefSpec::Runner.new(step_into: ['parted_disk']).converge(described_recipe)
  end

  it 'makes a label' do
    chef_run.should run_execute 'parted /dev/sdb --script -- mklabel gpt'
  end

  it 'partitions' do
    cmd = 'parted /dev/sdb --script -- mkpart primary ext4 1 -1'
    chef_run.should run_execute cmd
  end

  it 'creates fs' do
    chef_run.should run_execute 'mkfs.ext4 /dev/sdb1'
  end
end
