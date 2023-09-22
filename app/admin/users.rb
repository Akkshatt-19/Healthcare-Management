ActiveAdmin.register User do
  permit_params :name, :email, :password_digest, :role, :reset_password_token, :reset_password_sent_at,:image
  index do
    selectable_column
    id_column
    column :email
    column :id
    column :name
    column :role
    column :image do |user|
      if user.image.attached?
        image_tag url_for(user.image),size: "50x50"
      else
        "No Image Available"
      end
    end
    actions
  end
  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password_digest
      f.input :role
      f.input :image, as: :file
    end
    f.actions 
  end  

  show do
    attributes_table do
      row :name
      row :email
      row :id
      row :role
      row :image do |user|
        if user.image.attached?
          image_tag url_for(user.image),size: "350x450"
        else
          "No Image Available"
        end
      end
    end
    active_admin_comments
  end
  filter :name
  filter :email
  filter :id
  
end
