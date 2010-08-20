module ActsAsAuthorizable
  module Handler
    CAN_METHOD  = /^can_(.*)/
    class_eval do
      def handle_can_methods(feature_name,args)
        acl = AccessRights::Default.clone
        raise ActsAsAuthorizable::AccessRights::RuleNotDefined unless acl.has_key?(feature_name)
        acl[feature_name][usertype(args.first)]
      end  

      def method_missing(method_name,*args)
        r1 = /^can_/
        method_name = method_name.to_s
        
        if method_name =~ CAN_METHOD 
          method_name.chop! if method_name[-1].chr == "?"
          handle_can_methods(method_name.gsub(r1,""),args)
          
          #TO-DO - non existant can_* methods should call "super" 
          #so that undefined method error is thrown
        else 
          super(method_name.to_sym,*args)
        end  
      end  
      
      def respond_to?(method)
        return true if method.to_s =~ CAN_METHOD
        super
      end
      
    end
  end
end