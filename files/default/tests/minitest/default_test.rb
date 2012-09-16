describe_recipe "cookbook-parted" do
  include ::MiniTest::Chef::Assertions
  include ::MiniTest::Chef::Context
  include ::MiniTest::Chef::Resources

  describe "package" do
    it "installs" do
      package("parted").must_be_installed
    end
  end
end
