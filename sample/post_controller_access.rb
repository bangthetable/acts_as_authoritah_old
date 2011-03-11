module PostControllerAccess
  def self.new(controller)
    unless controller.present_user.can_create_a_post?
      controller.deny_unauthorized_access
    end
  end
  
  def self.create(controller)
    unless controller.present_user.can_create_a_post?
      controller.deny_unauthorized_access
    end
  end
  
  def self.edit(controller)
    @post = Post.find(controller.params[:id])
    unless controller.present_user.can_edit_a_post?(:context => @post.status)
      controller.deny_unauthorized_access
    end
  end

  def self.update(controller)
    @post = Post.find(controller.params[:id])
    unless controller.present_user.can_edit_a_post?(:context => @post.status)
      controller.deny_unauthorized_access
    end
  end

  def self.show(controller)
    @post = Post.find(controller.params[:id])
    unless controller.present_user.can_view_posts?(:context => @post.status)
      controller.deny_unauthorized_access
    end
  end

end

