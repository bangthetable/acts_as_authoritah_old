module ActsAsAuthorizable
  module Loader
    
    def acts_as_authorizable(args={})
      if File.exists?(args[:acl_folder]) and Dir.has_xls_files?(args[:acl_folder])
        if args[:default]
          AccessRights::load_all_files(args[:acl_folder],args[:default])
        else
          AccessRights::load_all_files(args[:acl_folder])
        end
      elsif !Dir.has_xls_files?(args[:acl_folder])
        raise ActsAsAuthorizable::AccessRights::AclFilesNotFound
      else
        raise ActsAsAuthorizable::AccessRights::AclFolderNotFound
      end
    end
    
  end
end

def Dir.xls_files(dir)
  Dir.entries(dir).reject{|f| File.directory?(f)}.select{|x| x.split(".").last.downcase == "xls"}
end

def Dir.has_xls_files?(dir)
  !Dir.xls_files(dir).empty?
end