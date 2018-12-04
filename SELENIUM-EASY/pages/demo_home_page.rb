class DemoHomePage < SeleniumEasyRootPage

  add_id_element(:div, /WELCOME TO SELENIUM EASY DEMO/i, id: 'home')

  add_route(:SimpleFormDemoPage, :to_simple_form_page)

  def create_elements; end

end