class DemoHomePage < SeleniumEasyRootPage

  add_id_element(:div, /WELCOME TO SELENIUM EASY DEMO/i, id: 'home')

  def create_elements; end

end