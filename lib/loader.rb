module ActsAsAuthorizable
  module Loader
    def acts_as_authorizable(args={})
      AccessRights::load(args[:acl])
    end
  end
end