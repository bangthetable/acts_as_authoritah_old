require 'test_helper'

class ActsAsAuthorizableTest < Test::Unit::TestCase
  def test_foo
    assert !Factory.build(:admin_user).can_make_a_comment?
    assert !Factory.build(:anonymous_user).can_make_a_comment?
    assert Factory.build(:registered_user).can_make_a_comment?
  end
end
