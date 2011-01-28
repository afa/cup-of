class MainController < ApplicationController

 before_filter :authenticate_user!, :only => :profile

  def index
   @article = Article.where(:active=>true, :on_main=>true).order("created_at desc").first
  end

  def search
   query = params[:search].andand[:q].andand.strip.andand.split(' ') || []
   @searches = query.select{|q| q.mb_chars.strip.size >= 3 }.inject([]){|res, q| res + (Product.where("name ilike ?", "%#{q.mb_chars}%") + Product.where("description ilike ?", "%#{q.mb_chars}%"))}.uniq.paginate(:page=>params[:page] || 1, :per_page=>20)
  end

  def contacts
  end

  def transport
  end

  def about
  end

  def profile
   if user_signed_in?
    @purchases = Purchase.where("user_id = :uid or u_mail = :umail", :uid => current_user.id, :umail => current_user.email).order("id").all
   end
  end

end
