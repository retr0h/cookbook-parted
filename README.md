[![Build Status](https://travis-ci.org/retr0h/cookbook-parted.png?branch=master)](https://travis-ci.org/retr0h/cookbook-parted)

Description
============

Installs/Configures parted

Requirements
============

* Chef 0.8+

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

  action :mkpart
end
```

default
----

Installs/Configures parted

Testing
=====

This cookbook is using [ChefSpec](https://github.com/acrmp/chefspec) for
testing. Should run the following before commiting. It will run your tests,
and check for lint errors.

    % ./run_tests.bash

License and Author
==================

Author:: John Dewey (<john@dewey.ws>)

Copyright 2012-2013, John Dewey

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
