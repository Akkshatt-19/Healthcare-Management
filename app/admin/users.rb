ActiveAdmin.register User do
  permit_params :name, :email, :password_digest, :role, :reset_password_token, :reset_password_sent_at,:image
  index do
    selectable_column
    id_column
    column :email
    column :id
    column :name
    column :image do |img|
      image_url image.
    end
    actions
  end
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password_digest, :role, :reset_password_token, :reset_password_sent_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :name
  
end
