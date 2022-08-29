ActiveAdmin.register Image do
  permit_params :vehicle_id, :image, :primary

  form do |f|
    f.inputs do
      f.input :vehicle_id, as: :select, collection: Vehicle.all.map{|v| v.id}, include_blank: true
      f.input :image, as: :file
      f.input :primary
    end
    para "Press cancel to return to the list without saving."
    f.actions
  end
end
