require 'page-object'

class CreationPage
  include PageObject

  page_url "http://localhost:4567/create"

  text_field(:author, :id => "post-author")
  text_field(:title, :id => "post-title")
  text_area(:content, :id => "post-body")
  button(:submit, :id => "submit-post")
  button(:cancel, :id => "cancel-post")


  def create_valid_post
    self.title = "My Blog Title"
	  self.content = "This is my post's content."
    self.author = "Corby Lane"
  end

  def create_invalid_post
    self.author = "Corby Lane"
    self.content = "Here is some stuff that I wrote"
  end

  def create_duplicate_post
    self.author = "Corby Lane"
    self.title = "Dup title"
    self.content = "The meaning of life is 42"
    self.submit
  end

  def submit_post
    self.submit
  end

  def cancel_post
  	self.create_valid_post
  	self.cancel
  end

  def valid_post_to_home
    self.author = "Corby Lane"
    self.title = "Title number #{$post_number}"
    self.content = "This is the body of the post to check the existence of on the home page"
  end
end