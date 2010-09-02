module ActsAsAuthorizable
  def deny_unauthorized_access
    if File.exists?("#{Rails.public_path}/401.html") and !request.xhr?
      render :file => "#{Rails.public_path}/401.html", :status => :unauthorized and return
    else
      render :text => "access denied", :status => :unauthorized and return 
    end
  end
  
  module AccessRights
    ACL     = Hash.new
    Default = Hash.new  
    Urls    = {}
    
    def self.feature_list
      Default.keys.collect(&:downcase)
    end
    
    def self.urls(context)
      h = {}
      ACL[context].keys.collect(&:downcase).each do |feature|
        h[feature] = access_url(feature)
      end
      h
    end
    
    def self.access_url(feature)
      Urls[feature.downcase]
    end
        
    def self.contexts
      ACL.keys.collect(&:downcase)
    end
    
    def self.load_all_files(dir,default_file="default.xls")
      Dir.xls_files(dir).each do |file|
        acl_type = file.split(".").first
        ACL[acl_type] = load(File.join(dir,file)) 
      end
      
      (ACL[default_file.split(".").first] || {}).each_pair do |key,value|
        Default[key] = value
      end
    end
    
    def self.load(file)
      hash = {}
      book = Spreadsheet.open file
      sheet = book.worksheets.first
      
      urls_column_index = -1
      
      usertypes = []
      
      sheet.each do |row|
        if row[0] == 'name'
          k = 2
          while true
            usertype = row[k]
            break unless usertype
            
            usertypes << usertype unless usertype.downcase == "url"
            urls_column_index = k if usertype.downcase == "url"
            
            k += 1
          end
          usertypes = usertypes.collect(&:downcase)
          next
        end
        
        h = Hash.new
        feature_name = row[0]
        
        next unless feature_name
        feature_name.strip!
        
        Urls[feature_name] = row[urls_column_index] unless urls_column_index == -1
        
        usertypes.each_with_index do |key,i|
          value = row[i+2] ? true : false
          h[key]=value
        end  
        hash[feature_name] = h
      end
      return hash
    end
  end
end