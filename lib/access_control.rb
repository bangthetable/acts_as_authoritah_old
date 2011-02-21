Dir[File.join('lib','access_control','*.rb')].each {|f| require f}

module AccessControls
  def self.access_control(controller)
    params = controller.params
    access_control_method = params[:action]
    begin
      access_module = (controller.class.to_s + "Access").constantize
    rescue => e
      if e.to_s =~ /uninitialized constant/
        Rails.logger.info "\nAccess control module for #{controller.class.to_s} is not defined yet\n"
        return true
      else
        raise
      end
    end
    
    begin
      return access_module.send(access_control_method,controller)
    rescue => e
      if e.to_s =~ /undefined method/
        Rails.logger.info "#{e.to_s}\nAccess control method '#{access_control_method}' is not defined yet in " +
                          controller.class.to_s + "Access" + "module\n"
        return true
      else
        raise
      end
    end
  end
end
