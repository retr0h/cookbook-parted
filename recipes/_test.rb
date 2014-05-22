# encoding: UTF-8
#
# Cookbook Name:: parted
# Recipe:: _test
#
# Copyright 2012-2014, John Dewey
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

parted_disk 'making label' do
  device '/dev/sdb'
  action :mklabel
end

parted_disk 'making part' do
  device '/dev/sdb'
  action :mkpart
end

parted_disk 'making fs' do
  device '/dev/sdb1'
  action :mkfs
end

parted_disk 'setting flag' do
  device '/dev/sdb'
  action :setflag
end
