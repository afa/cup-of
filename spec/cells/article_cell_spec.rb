require 'spec_helper'

describe ArticleCell do
  context "cell rendering" do 
    
    context "rendering display" do
      subject { render_cell(:article, :display) }
  
      it { should have_selector("h1", :content => "Article#display") }
      it { should have_selector("p", :content => "Find me in app/cells/article/display.html") }
    end
    
    context "rendering display_short" do
      subject { render_cell(:article, :display_short) }
  
      it { should have_selector("h1", :content => "Article#display_short") }
      it { should have_selector("p", :content => "Find me in app/cells/article/display_short.html") }
    end
    
    context "rendering form" do
      subject { render_cell(:article, :form) }
  
      it { should have_selector("h1", :content => "Article#form") }
      it { should have_selector("p", :content => "Find me in app/cells/article/form.html") }
    end
    
    context "rendering row" do
      subject { render_cell(:article, :row) }
  
      it { should have_selector("h1", :content => "Article#row") }
      it { should have_selector("p", :content => "Find me in app/cells/article/row.html") }
    end
    
  end


  context "cell instance" do 
    subject { cell(:article) } 
    
      it { should respond_to(:display) }
    
      it { should respond_to(:display_short) }
    
      it { should respond_to(:form) }
    
      it { should respond_to(:row) }
    
  end
end
