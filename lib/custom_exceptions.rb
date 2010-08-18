module ActsAsAuthorizable
  module AccessRights
    class FileNotFound < RuntimeError; end
    class RuleNotDefined < RuntimeError; end
  end
end
