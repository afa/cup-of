class MordolentaCell < Cell::Rails

  def display
   @m_items = Product.where(:active=>true).order('random()').limit(30)
   render
  end

end
