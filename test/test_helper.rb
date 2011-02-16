require 'rubygems'
require 'test/unit'
require 'factory_girl'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'activerecord_test_connector' 
require 'authoritah'

ActiveRecordTestConnector.setup

#load users factory
require 'test/factories/users'

class Test::Unit::TestCase
  protected
  def assert_respond_to_all object, methods
    methods.each do |method|
      [method.to_s, method.to_sym].each { |m| assert_respond_to object, m }
    end
  end
end
