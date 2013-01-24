require "chefspec"

describe "parted::default" do
  before do
    @chef_run = ::ChefSpec::ChefRunner.new.converge "parted::default"
  end

  it "installs package" do
    @chef_run.should upgrade_package "parted"
  end
end
