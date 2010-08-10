ActiveRecord::Schema.define do
  create_table "users", :force => true do |t|
    t.column "usertype", :string
    t.column "login",    :string
  end
end
