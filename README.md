[![Build Status](http://img.shields.io/travis/retr0h/cookbook-parted.svg?style=flat-square)](https://travis-ci.org/retr0h/cookbook-parted)
[![Dependency Status](http://img.shields.io/gemnasium/retr0h/cookbook-parted.svg?style=flat-square)](https://gemnasium.com/retr0h/cookbook-parted)
[![Chef](http://img.shields.io/cookbook/v/parted.svg?style=flat-square)](https://supermarket.getchef.com/cookbooks/parted)

Description
============

Installs/Configures parted

Requirements
============

* Chef 12
* Ruby 2.1.0/2.2.0

Attributes
==========

Usage
=====

```json
"run_list": [
    "recipe[parted]"
]
```

Use parted to create an gpt disk label on /dev/sdb

```ruby
parted_disk "/dev/sdb" do
  label_type "gpt"

  action :mklabel
end
```

Use parted to make a primary ext4 partition on /dev/sdb

```ruby
parted_disk "/dev/sdb" do
  part_type   "primary" # logical or extended
  file_system "ext4"

  action :mkpart
end
```

Make an ext4 file system on /dev/sdb1

```ruby
parted_disk "/dev/sdb1" do
  file_system "ext4"

  action :mkfs
end
```

Make an ext4 file system on /dev/sdb1 with a size of 800GB (default in MB)

```ruby
parted_disk "/dev/sdb1" do
  file_system "ext4"
  part_start  "1"
  part_end    "819200"

  action :mkfs
end
```

Set the raid flag on file system on /dev/sdb1
```ruby
parted_disk "/dev/sdb1" do
  flag_name "raid"
  action :setflag
end
```

default
-------

Installs/Configures parted

Testing
=======

    $ rake

License and Author
==================

Author:: John Dewey (<john@dewey.ws>)

Copyright 2012-2016, John Dewey

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
