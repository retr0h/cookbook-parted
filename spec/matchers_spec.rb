# encoding: UTF-8

require_relative 'spec_helper'

describe 'parted::_test' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'provides a chefspec matcher for mklabel' do
    expect(chef_run).to mklabel_parted_disk('making label')
  end

  it 'provides a chefspec matcher for mkpart' do
    expect(chef_run).to mkpart_parted_disk('making part')
  end

  it 'provides a chefspec matcher for mkfs' do
    expect(chef_run).to mkfs_parted_disk('making fs')
  end

  it 'provides a chefspec matcher for setflag' do
    expect(chef_run).to setflag_parted_disk('setting flag')
  end
end
