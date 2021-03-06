ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :role_id, :password
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form title: 'New User' do |f|
    inputs 'Details' do
      input :role
      input :email
      input :password
    end
    actions
  end

index do
  id_column
  column :email
  column :role
  actions
end

end
