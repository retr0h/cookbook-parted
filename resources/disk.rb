# encoding: UTF-8
#
# Cookbook Name:: parted
# Resource:: disk
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

actions :mklabel, :mkpart, :mkfs, :setflag, :nothing

attribute :device, kind_of: String, name_attribute: true
attribute :label_type, kind_of: String, default: 'gpt'
attribute :file_system, kind_of: String, default: 'ext4'
attribute :part_number, kind_of: Integer, default: 1
attribute :part_type, kind_of: String, default: 'primary'
attribute :part_start, kind_of: String, default: '1'
attribute :part_end, kind_of: String, default: '-1'
attribute :flag_name, kind_of: String, default: 'boot'

def initialize(*args)
  super
  @action = :mklabel
end
