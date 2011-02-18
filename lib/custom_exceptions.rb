module ActsAsAuthoritah
  module AccessRights
    class UnknownContext < RuntimeError; end
    class AclFilesNotFound < RuntimeError; end
    class AclFolderNotFound < RuntimeError; end
    class RuleNotDefined < RuntimeError; end
  end
end
