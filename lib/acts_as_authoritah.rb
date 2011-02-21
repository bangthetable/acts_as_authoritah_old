require "active_record"
require "spreadsheet"

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "loader"
require "handler"
require "access_rights"
require "access_control"
require "custom_exceptions"

$LOAD_PATH.shift

Spreadsheet.client_encoding = 'UTF-8'


if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsAuthoritah::Loader
  ActiveRecord::Base.send :include, ActsAsAuthoritah::Handler
end

