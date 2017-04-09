class LeaveApplicationDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def get_formated_date(inp_date)
  	inp_date.strftime("%d/%m/%Y")
  end

  def get_leave_type(leave_type)
  	leave_type == 1 ? "Full Day" : "Half Day"
  end

  def get_session_name(session_name)
  	session_name == 1? "Forenoon" : session_name == 2 ?  "Afternoon" : ""
  end

  def get_status(status)
  	status.nil? ? "Pending" : status ? "Approved" : "Rejected"
  end

end
