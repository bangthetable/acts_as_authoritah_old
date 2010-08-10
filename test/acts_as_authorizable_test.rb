require 'test_helper'

class ActsAsAuthorizableTest < Test::Unit::TestCase
  def test_responds_to_all_can_methods
    can_methods = ActsAsAuthorizable::AccessRights::feature_list.collect{|feature| 'can_' + feature + '?'}
    assert_respond_to_all Factory.build(:anonymous_user),can_methods
  end
  
  def test_should_not_respond_to_any_non_existing_methods
    assert !Factory.build(:anonymous_user).respond_to?(:non_existant_method)
  end
end
