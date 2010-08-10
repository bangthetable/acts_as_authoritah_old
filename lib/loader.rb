module Loader
  def acts_as_authorizable(args={})
    AccessRights::load('access_rights.xls')
  end
end