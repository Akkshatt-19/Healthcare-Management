ActiveAdmin.register TestCenter do
  permit_params :name, :hospital_id, :location,:image
  
  index do
    selectable_column
    id_column
    column :location
    column :hospital
    column :name
    column :image do |test_center|
      if test_center.image.attached?
        image_tag url_for(test_center.image),size: "50x50"
      else
        "No Image Available"
      end
    end
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :hospital
      f.input :location
      f.input :image, as: :file
    end
    f.actions 
  end  
  
  show do
    attributes_table do
      row :name
      row :location
      row :hospital
      row :image do |test_center|
        if test_center.image.attached?
          image_tag url_for(test_center.image),size: "350x450"
        else
          "No Image Available"
        end
      end
    end
    active_admin_comments
  end
  
  filter :name
  filter :location
  
end