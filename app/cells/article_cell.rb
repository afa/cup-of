class ArticleCell < Cell::Rails

  def display
    render
  end

  def display_on_main
   @article = Article.where(:active=>true, :on_main=>true).order("created_at desc").first
   render
  end

  def display_short
    render
  end

  def display_linked
    @articles = Article.order("created_at desc").limit(5)
    render
  end

  def form(args)
   @article = args[:article]
   @method = args[:method]
   @url = args[:url]
   render
  end

  def row(args)
   @article = args[:article]
   render
  end

end
