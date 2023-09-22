ActiveAdmin.register Appointment do
  permit_params :user_id, :description, :hospital_id, :test_center_id, :status
  
  index do
    selectable_column
    id_column
    column :user
    column :description
    column :hospital
    column :test_center
    column :status
    actions
  end

  show do
    attributes_table do
      row :user
      row :description
      row :hospital_id
      row :test_center
      row :status
    end
  end

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :description
      f.input :hospital_id
      f.input :test_center_id
      f.input :status
    end
  end
  
  filter :user
  filter :hospital
  filter :test_center  
end
