module LeadHelper
  def lead_home(item)
  	image = "mandarines.jpg" || item[:lead_image]
  	"/images/lead/"+image.split(".")[0]+"-home."+image.split(".")[1]
  end

  def lead_thumbnail(item)
  	image = "mandarines.jpg" || item[:lead_image]
  	"/images/lead/"+image.split(".")[0]+"-thumbnail."+image.split(".")[1]

  end

  def lead_bandeau(item)
  	image = "mandarines.jpg" || item[:lead_image]
  	"/images/lead/"+image.split(".")[0]+"-bandeau."+image.split(".")[1]
  end

  def leads
  	articles.select { |item| !item[:tags].nil? && item[:tags].include?('lead') }
  end

  def the_lead
  	leads.sort_by{|el| el[:date]}.first
  end
end