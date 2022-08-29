ActiveAdmin.register Vehicle do
  permit_params :manufacturer, :model, :plate_number, :category, :body_style, :color,
                :year, :ad_size, :ad_duration, :tracker_imei, :city, :total_km, :user_id,
                :last_four_weeks_km, :percentage, :published, :km_price, :cities, :elderships

  index do
    selectable_column
    id_column
    column :tracker_imei
    column :published
    column :plate_number
    column :updated_at
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.all.map{|u| [u.email, u.id]}, include_blank: false
      f.input :manufacturer
      f.input :model
      f.input :plate_number
      f.input :category
      f.input :body_style, as: :select, collection: ["Sedanas", "Hečbekas", "Universalas", "Visureigis", "Vienatūris", "Kupė", "Komercinis", "Kabrioletas", "Limuzinas", "Pikapas", "Kita"]
      f.input :color, as: :select, collection: ["Balta/Perlas", "Geltona/Auksas", "Juoda", "Mėlyna/Žydra", "Oranžinė", "Pilka", "Sidabrinė", "Raudona", "Ruda/Rusva", "Žalia", "Kita"]
      f.input :year, as: :select, collection: Date.today.year.downto(2005)
      f.input :ad_size, as: :select, collection: ["full", "half", "partial"]
      f.input :ad_duration, as: :select, collection: [90, 180, 365]
      f.input :tracker_imei
      f.input :published
      f.input :km_price
    end
    para "Press cancel to return to the list without saving."
    f.actions
  end
end
