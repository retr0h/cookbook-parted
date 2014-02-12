# encoding: UTF-8

require_relative 'spec_helper'

describe 'parted::_test' do
  before { stub_command(/.*/) }
  describe 'lwrps' do
    it 'makes a label' do
      chef_run = ChefSpec::Runner.new step_into: ['parted_disk']
      chef_run.converge 'parted::_test'

      chef_run.should run_execute 'parted /dev/sdb --script -- mklabel gpt'
    end

    it 'partitions' do
      chef_run = ChefSpec::Runner.new step_into: ['parted_disk']
      chef_run.converge 'parted::_test'

      cmd = 'parted /dev/sdb --script -- mkpart primary ext4 1 -1'
      chef_run.should run_execute cmd
    end

    it 'creates fs' do
      chef_run = ChefSpec::Runner.new step_into: ['parted_disk']
      chef_run.converge 'parted::_test'

      chef_run.should run_execute 'mkfs.ext4 /dev/sdb1'
    end
  end
end
