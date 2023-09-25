ActiveAdmin.register Hospital do
  permit_params :name, :location, :user_id, :test_centers_id,:image
  
  index do
    selectable_column
    id_column
    column :location
    column :id
    column :name
    column :image do |hospital|
      if hospital.image.attached?
        image_tag url_for(hospital.image),size: "50x50"
      else
        "No Image Available"
      end
    end
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :user
      f.input :location
      f.input :image, as: :file
    end
    f.actions 
  end  
  
  show do
    attributes_table do
      row :name
      row :location
      row :id
      row :image do |hospital|
        image_tag url_for(hospital.image),size: "350x450"
      end
    end
  end
  
  filter :hospital
  filter :location
  
end
