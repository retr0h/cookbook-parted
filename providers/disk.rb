# encoding: UTF-8
#
# Cookbook Name:: parted
# Provider:: parted
#
# Copyright 2012-2016, John Dewey
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

use_inline_resources

action :mklabel do
  execute "parted #{new_resource.device} --script -- mklabel #{new_resource.label_type}" do
    new_resource.updated_by_last_action(true)

    not_if "parted #{new_resource.device} --script -- print |grep 'Partition Table: #{new_resource.label_type}'"
  end
end

action :mkpart do
  execute "parted #{new_resource.device} --script -- mkpart #{new_resource.part_type} #{new_resource.file_system} \
#{new_resource.part_start} #{new_resource.part_end}" do
    new_resource.updated_by_last_action(true)

    # Number  Start   End    Size   File system  Name  Flags
    #  1      17.4kB  537GB  537GB               xfs
    not_if "parted #{new_resource.device} --script -- print |sed '1,/^Number/d' |grep #{new_resource.part_type}"
  end
end

action :mkfs do
  execute "mkfs.#{new_resource.file_system} #{new_resource.device}" do
    new_resource.updated_by_last_action(true)

    # /dev/sdb1: SGI XFS filesystem data (blksz 4096, inosz 256, v2 dirs)
    # or
    # /dev/sdb1: Linux rev 1.0 ext4 filesystem data, UUID=435fd604-cf17-4f5c-b39a-c9829a209ed5 (extents) (large files) (huge files)
    not_if "file -sL #{new_resource.device} |grep -i #{new_resource.file_system}"
  end
end

action :setflag do
  execute "parted #{new_resource.device} --script -- set 1 #{new_resource.flag_name} on" do
    new_resource.updated_by_last_action(true)

    # Number  Start   End    Size   Type     File system  Flags
    #  1      1049kB  107GB  107GB  primary               boot
    not_if "parted #{new_resource.device} --script -- print |grep '#{new_resource.flag_name}'"
  end
end

action :nothing do
  new_resource.updated_by_last_action(false)
end
