# encoding: UTF-8

require_relative 'spec_helper'

describe 'parted::_test' do
  before { stub_command(/.*/) }
  let(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['parted_disk']).converge(described_recipe)
  end

  it 'makes a label' do
    expect(chef_run).to run_execute 'parted /dev/sdb --script -- mklabel gpt'
  end

  it 'does not make a label when exists' do
    stub_command("parted /dev/sdb --script -- print |grep 'Partition Table: gpt'")
      .and_return true
    expect(chef_run).not_to run_execute 'parted /dev/sdb --script -- mklabel gpt'
  end

  it 'partitions' do
    allow(File).to receive(:exist?).and_return(false)
    cmd = 'parted /dev/sdb --script -- mkpart primary ext4 1 -1'
    expect(chef_run).to run_execute cmd
  end

  it 'creates fs' do
    expect(chef_run).to run_execute 'mkfs.ext4 /dev/sdb1'
  end

  it 'does not create fs when exists' do
    stub_command('file -sL /dev/sdb1 |grep -i ext4').and_return true
    expect(chef_run).not_to run_execute 'mkfs.ext4 /dev/sdb1'
  end

  it 'sets a flag' do
    expect(chef_run).to run_execute 'parted /dev/sdb --script -- set 1 boot on'
  end

  it 'does not set a flag when already set' do
    stub_command("parted /dev/sdb --script -- print |grep 'boot'")
      .and_return true
    expect(chef_run).not_to run_execute 'parted /dev/sdb --script -- set 1 boot on'
  end
end
