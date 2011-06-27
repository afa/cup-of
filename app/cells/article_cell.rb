class ArticleCell < Cell::Rails

  def display
    render
  end

  def display_short
    render
  end

  def form(args)
   @article = args[:article]
   @method = args[:method]
   @url = args[:url]
   render
  end

  def row
    render
  end

end
