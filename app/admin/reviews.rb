ActiveAdmin.register Review do
  permit_params :user_id, :reviewable_id, :reviewable_type, :feedback
  filter :user_id
  
  index do
    selectable_column
    id_column
    column :user_id
    column :reviewable_id
    column :reviewable_type
    column :feedback  
    actions
    
  end
  show do
    attributes_table do
      row :user_id
      row :reviewable_id
      row :reviewable_type
      row :feedback
    end
  end
  form do |f|
    f.inputs do
      f.input :user_id
      f.input :reviewable_id
      f.input :reviewable_type
      f.input :feedback
    end
    f.actions 
  end  
end
