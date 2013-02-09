#
# Cookbook Name:: raid
# Provider:: parted
#
# Copyright 2012-2013, John Dewey
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

action :mklabel do
  execute "parted #{new_resource.device} --script -- mklabel #{new_resource.label_type}" do
    new_resource.updated_by_last_action(true)

    not_if "parted #{new_resource.device} --script -- print |grep 'Partition Table: #{new_resource.label_type}'"
  end
end

action :mkpart do
  execute "parted #{new_resource.device} --script -- mkpart #{new_resource.part_type} #{new_resource.file_system} 1 -1" do
    new_resource.updated_by_last_action(true)

    not_if "parted #{new_resource.device} --script -- print |grep #{new_resource.part_type}"
  end
end

action :mkfs do
  execute "mkfs.#{new_resource.file_system} #{new_resource.device}" do
    new_resource.updated_by_last_action(true)

    not_if "file -sL #{new_resource.device} |grep #{new_resource.part_type}"
  end
end
