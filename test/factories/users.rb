class User < ActiveRecord::Base
  authoritah :acl => File.join(File.dirname(__FILE__), '..','input','access_rights.xls')
end

Factory.define :user do |u|
end

Factory.define :admin_user, :parent => :user do |u|
  u.usertype "admin"
end

Factory.define :client_user, :parent => :user do |u|
  u.usertype "client"
end

Factory.define :project_user, :parent => :user do |u|
  u.usertype "project"
end

Factory.define :registered_user, :parent => :user do |u|
  u.usertype "registered"
end

Factory.define :anonymous_user, :parent => :user do |u|
  u.usertype "anonymous"
end

Factory.define :panel_user, :parent => :user do |u|
  u.usertype "panel"
end