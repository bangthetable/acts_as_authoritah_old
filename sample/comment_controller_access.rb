module CommentControllerAccess
  def self.new(controller)
    unless controller.present_user.can_post_a_comment?
      controller.deny_unauthorized_access
    end
  end
  
  def self.create(controller)
    unless controller.present_user.can_post_a_comment?
      controller.deny_unauthorized_access
    end
  end
end

