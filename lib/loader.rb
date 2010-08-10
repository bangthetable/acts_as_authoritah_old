module ActsAsAuthorizable
  module Loader
    def acts_as_authorizable(args={})
      if File.exists?(args[:acl])
        AccessRights::load(args[:acl])
      else
        raise ActsAsAuthorizable::AccessRights::FileNotFound
      end
    end
  end
end