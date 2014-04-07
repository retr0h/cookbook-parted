# encoding: UTF-8

require_relative 'spec_helper'

describe 'parted::_test' do
  before { stub_command(/.*/) }
  let(:chef_run) do
    ChefSpec::Runner.new(step_into: ['parted_disk']).converge(described_recipe)
  end

  it 'makes a label' do
    expect(chef_run).to run_execute 'parted /dev/sdb --script -- mklabel gpt'
  end

  it 'partitions' do
    cmd = 'parted /dev/sdb --script -- mkpart primary ext4 1 -1'
    expect(chef_run).to run_execute cmd
  end

  it 'creates fs' do
    expect(chef_run).to run_execute 'mkfs.ext4 /dev/sdb1'
  end
end
