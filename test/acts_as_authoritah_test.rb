require_relative 'test_helper'

class ActsAsAuthoritahTest < Test::Unit::TestCase
  def test_responds_to_all_can_methods
    can_methods = ActsAsAuthoritah::AccessRights::feature_list.collect{|feature| 'can_' + feature + '?'}
    assert_respond_to_all Factory.build(:anonymous_user),can_methods
  end
  
  def test_should_not_respond_to_any_non_existing_methods
    assert !Factory.build(:anonymous_user).respond_to?(:non_existant_method)
  end
  
  def test_can_methods_should_function_as_per_the_access_rights_specified_in_spead_sheet
    spreadsheet_hash = ActsAsAuthoritah::AccessRights::Default
    
    spreadsheet_hash.each_pair {|feature,hash|
      can_method = 'can_' + feature + '?'
      hash.keys.each do |usertype| 
        assert_equal Factory.build(usertype + '_user').send(can_method),hash[usertype]
      end
    }
  end
end
