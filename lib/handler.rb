module ActsAsAuthorizable
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
end