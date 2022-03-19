module ApplicationHelper
  def total_auto_helper(count)
    if count == 0
      "#{count}automobilių"
    elsif count == 1
      "#{count} automobilis"
    else
      "#{count} automobiliai"
    end
  end
end
