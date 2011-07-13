require 'spec_helper'

describe ArticleCell do
  context "cell rendering" do 
    let(:article) {FactoryGirl.create(:article)}
    context "rendering display" do
      subject { render_cell(:article, :display, :article=>article) }
  
      it { should have_xpath("//div[@class='article']", :text=>article.body)}
    end
    
    context "rendering display_short" do
      subject { render_cell(:article, :display_short, article) }
  
      it { should have_xpath("//div[@class='article']", :text=>article.shorten_body)}
    end
    
    context "rendering display_on_main" do
      let(:article){FactoryGirl.create(:article, :on_main => true)}
      subject { render_cell(:article, :display_on_main) }
  
      it { should have_xpath("//div[@class='article']", :text => article.body) }
    end
    
    context "rendering display_linked" do
      subject { render_cell(:article, :display_linked) }
  
      it { should have_xpath("//div[@class='article right']", :text => article.body) }
    end
    
    context "rendering form" do
      subject { render_cell(:article, :form, :article => article) }
  
      it { should have_xpath("//input[@type='text'][@name='article[name]'][@value='#{article.name}']") }
      it { should have_xpath("//input[@type='file'][@name='article[pic]']") }
      it { should have_xpath("//input[@type='checkbox'][@name='article[on_main]']") }
      it { should have_xpath("//input[@type='checkbox'][@name='article[active]']") }
      it { should have_xpath("//textarea[@name='article[body]']", :text=>article.body) }
    end
    
    context "rendering row" do
      subject { render_cell(:article, :row, :article => article) }
  
      it { should have_xpath("//tr/td/a[@href='/admin/articles/#{article.id}/edit']") }
    end
    
  end


  context "cell instance" do 
    subject { cell(:article) } 
    
      it { should respond_to(:display) }
      it { should respond_to(:display_on_main) }
    
      it { should respond_to(:display_short) }
      it { should respond_to(:display_linked) }
    
      it { should respond_to(:form) }
    
      it { should respond_to(:row) }
    
  end
end
