module ActsAsAuthorizable
  module AccessRights
    Default = Hash.new
        
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