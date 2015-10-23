require 'page-object'

class SuccessPage
  include PageObject

  page_url "http://localhost:4567/create/post"

  button(:home, id => "go-home")

  def go_home
  	self.home
  end