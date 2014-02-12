# encoding: UTF-8

require_relative 'spec_helper'

describe 'parted::default' do
  before do
    @chef_run = ChefSpec::Runner.new.converge 'parted::default'
  end

  it 'installs package' do
    @chef_run.should upgrade_package 'parted'
  end
end
