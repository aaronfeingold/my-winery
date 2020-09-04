module WinesHelper
  def last_updated(wine)
    wine.updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
  end
end
