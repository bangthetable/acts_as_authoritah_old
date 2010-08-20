module ActsAsAuthorizable
  def deny_unauthorized_access
    if File.exists?("#{Rails.public_path}/401.html") and !request.xhr?
      render :file => "#{Rails.public_path}/401.html", :status => :unauthorized and return
    else
      render :text => "access denied", :status => :unauthorized and return 
    end
  end
  
  module AccessRights
    Default = Hash.new
    
    def self.feature_list
      Default.keys.collect(&:downcase)
    end
    
    def self.load(file)
      hash = Default
      book = Spreadsheet.open file
      sheet = book.worksheets.first
      
      usertypes = []
      
      sheet.each do |row|
        if row[0] == 'name'
          k = 2
          while true
            usertype = row[k]
            break unless usertype
            usertypes << usertype
            k += 1
          end
          usertypes = usertypes.collect(&:downcase)
          next
        end
        
        h = Hash.new
        feature_name = row[0]
        
        usertypes.each_with_index do |key,i|
          value = row[i+2] ? true : false
          h[key]=value
        end  
        hash[feature_name] = h
      end
    end
  end
end