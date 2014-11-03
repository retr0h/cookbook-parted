# encoding: UTF-8

if defined?(ChefSpec)

  def mkpart_parted_disk(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:parted_disk, :mkpart, resource_name)
  end

  def mklabel_parted_disk(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:parted_disk, :mklabel, resource_name)
  end

  def mkfs_parted_disk(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:parted_disk, :mkfs, resource_name)
  end

  def setflag_parted_disk(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:parted_disk, :setflag, resource_name)
  end

end
