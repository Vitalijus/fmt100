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

  # Ad size
  def ad_size_select_helper
    ["Mazas", "Didelis"]
  end

  # Ad duration
  def ad_duration_select_helper
    [30, 60, 90]
  end
end
