require "rubygems"
require "acts_as_authoritah"

conn_hash = {
  :database => "coogeevillage",
  :username => "root",
  :password => "",
  :host => "localhost",
  :adapter => "mysql"
}
ActiveRecord::Base.establish_connection(conn_hash)



class User < ActiveRecord::Base
  acts_as_authoritah :acl => "~/Desktop/access_rights.xls"
  
  def usertype
    "admin"
  end
end




u = User.new
p u.can_make_a_comment?
