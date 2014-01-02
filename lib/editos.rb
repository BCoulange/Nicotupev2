module EditosHelper
  def editos
  	@items.select { |item| item[:kind] == 'edito' }
  end

  def last_edito
  	@items.select { |item| item[:kind] == 'edito' }.sort_by{|el| el[:date]}.first
  end
end