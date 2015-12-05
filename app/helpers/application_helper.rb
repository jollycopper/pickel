module ApplicationHelper

  # Style flash messages
  def bootstrap_class_for(flash_type)
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        "alert-" + flash_type.to_s
    end
  end
end
