module EditosHelper
  def editos
  	@items.select { |item| item[:kind] == 'edito' }
  end

  def last_edito
  	editos.sort_by{|el| el[:date]}.first
  end
end