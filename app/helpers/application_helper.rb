module ApplicationHelper
  def total_auto_helper(count)
    if count == 0
      "#{count} automobilių"
    elsif count == 1
      "#{count} automobilis"
    elsif count >= 2 && count <= 9
      "#{count} automobiliai"
    else count >= 10
      "#{count} automobilių"
    end
  end

  # Search cities
  def cities_options_for_select_helper
    vehicles = Vehicle.all

    result = vehicles.map do |vehicle|
      vehicle[:cities].first["city"] || vehicle["cities"].first["town"] if vehicle[:cities].present?
    end.compact.uniq
  end

  def km_converter_helper(distance)
    (distance.to_f / 1000).round(1)
  end

  # Ad size
  def ad_size_select_helper
    [["Pilnas", "full"], ["Pusė mašinos", "half"], ["Dalinis", "partial"]]
  end

  # Ad duration
  def ad_duration_select_helper
    [["iki 3mėn.", 90], ["iki 6mėn.", 180], ["iki 12mėn.", 365]]
  end

  # Body style
  def body_style_select_helper
    ["Sedanas", "Hečbekas", "Universalas", "Visureigis", "Vienatūris", "Kupė", "Komercinis", "Kabrioletas", "Limuzinas", "Pikapas", "Kita"]
  end

  # Color
  def color_select_helper
    ["Balta/Perlas", "Geltona/Auksas", "Juoda", "Mėlyna/Žydra", "Oranžinė", "Pilka", "Sidabrinė", "Raudona", "Ruda/Rusva", "Žalia", "Kita"]
  end
end
