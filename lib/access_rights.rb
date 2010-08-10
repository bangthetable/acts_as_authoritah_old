module ActsAsAuthorizable
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