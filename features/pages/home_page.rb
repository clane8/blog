require 'page-object'

class HomePage
  include PageObject

  page_url "http://localhost:4567"

  button(:create, :id => "create-post")
  #link()

  def new_post
  	self.create
  end

  def go_home
  	self.goto
  end

end



