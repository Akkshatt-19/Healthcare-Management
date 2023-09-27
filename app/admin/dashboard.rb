# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }
  
  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
    end
    columns do
      panel "Info" do
        para "Welcome to Healthcare Management Admin Portal"
      end
    end

    columns do
      column do
        panel "Recent Hospital" do
          ol do
            Hospital.last(5).map do |hospital|
              li link_to(hospital.name, admin_hospital_path(hospital))
            end
          end
        end
      end
      
      column do
        panel "Recent Appointments" do
          ul do
            Appointment.first(5).map do |appointment|
              li link_to(appointment.id, admin_appointment_path(appointment))
              li link_to(appointment.description, admin_appointment_path(appointment))
            end
          end
        end
      end

      column do
        panel "Recent Users" do
          ol do
            User.first(5).map do |user|
              li link_to(user.name, admin_user_path(user))
            end
          end
        end
      end
    end
  end 
end