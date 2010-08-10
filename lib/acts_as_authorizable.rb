require "active_record"
require "spreadsheet"

Spreadsheet.client_encoding = 'UTF-8'

module ActsAsAuthorizable
  module Main
    def acts_as_authorizable(args={})
      AccessRights::load('access_rights.xls')
    end
  end
  
  module Handler
    class_eval do
      def handle_can_methods(feature_name,args)
        object   = args.first
        acl = AccessRights::Default.clone
        acl[feature_name][usertype]
      end  

      def method_missing(method_name,*args)
        r  = /^can_(.*)/
        r1 = /^can_/
        method_name = method_name.to_s
        
        if method_name =~ r 
          method_name.chop! if method_name[-1].chr == "?"
           handle_can_methods(method_name.gsub(r1,""),args)
        else 
           super(method_name.to_sym,*args)
        end  
        
      end  
    end
  end
  
  module AccessRights
    Default = Hash.new
        
    def self.load(file)
      hash = Default
      book = Spreadsheet.open file
      sheet = book.worksheets.first
      
      sheet.each do |row|
        h = Hash.new
        feature_name = row[0]
        
        ['admin','client','project','panel','registered','anonymous'].each_with_index do |key,i|
          value = row[i+2] ? true : false
          h[key]=value
        end  
        hash[feature_name] = h
      end
    end
  end
end


if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsAuthorizable::Main
  ActiveRecord::Base.send :include, ActsAsAuthorizable::Handler
end

