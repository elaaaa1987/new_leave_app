ActiveAdmin.register LeaveApplication do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :start_date, :end_date, :leave_type, :session_name, :status, :reason, :user_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form title: 'Leave Application' do |f|
    inputs 'Details' do
      input :user
      input :start_date
      input :end_date
      input :leave_type
      input :session_name
      input :reason
      input :status
    end
    actions
  end

index do
  column :user
  column :start_date
  column :end_date
  column :leave_type do
  	:leave_type == 1 ? "Full Day" : "Half Day"
  end
  column :session_name do
  	:session_name == 1? "Forenoon" : :session_name == 2 ?  "Afternoon" : ""
  end
  column :reason
  column :status 

  actions
end



end
