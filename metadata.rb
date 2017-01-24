name 'parted'
maintainer 'John Dewey'
maintainer_email 'john@dewey.ws'
license 'Apache 2.0'
description 'Installs/Configures parted'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.1.5'

recipe 'parted', 'Installs/Configures parted'

%w(centos debian ubuntu).each do |os|
  supports os
end
