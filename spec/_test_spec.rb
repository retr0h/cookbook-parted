require "chefspec"

describe "parted::_test" do
  describe "lwrps" do
    it "makes a label" do
      chef_run = ::ChefSpec::ChefRunner.new :step_into => ['parted_disk']
      chef_run.converge "parted::_test"

      chef_run.should execute_command "parted /dev/sdb --script -- mklabel gpt"
    end

    it "partitions" do
      chef_run = ::ChefSpec::ChefRunner.new :step_into => ['parted_disk']
      chef_run.converge "parted::_test"

      chef_run.should execute_command "parted /dev/sdb --script -- mkpart primary ext4 1 -1"
    end

    it "creates fs" do
      chef_run = ::ChefSpec::ChefRunner.new :step_into => ['parted_disk']
      chef_run.converge "parted::_test"

      chef_run.should execute_command "mkfs.ext4 /dev/sdb1"
    end

    it "sure wish chefspec could handle guards" do
      pending
    end
  end
end
