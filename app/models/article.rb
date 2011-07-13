class Article < ActiveRecord::Base

 has_attached_file :pic

  def shorten_body
   body
  end
end
