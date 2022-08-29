ActiveAdmin.register Order do
  permit_params :phone_number, :company_title, :name, :surname, :email_address, :user_id,
                :status, :ad_size, :ad_duration, :ad_start, :ad_end, :vehicle_id

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.all.map{|v| [v.email, v.id]}, include_blank: false
      f.input :vehicle_id, as: :select, collection: Vehicle.all.map{|v| v.id}
      f.input :name
      f.input :surname
      f.input :phone_number
      f.input :company_title
      f.input :email_address
      f.input :status, as: :select, collection: ["pending", "active", "deactivated"], include_blank: false
      f.input :ad_size, as: :select, collection: ["full", "half", "partial"]
      f.input :ad_duration, as: :select, collection: [90, 180, 365]
      f.input :ad_start
      f.input :ad_end
    end
    para "Press cancel to return to the list without saving."
    f.actions
  end
end
