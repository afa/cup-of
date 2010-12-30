class MainController < ApplicationController
  def index
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

end
