class DemoHomePage < SeleniumEasyRootPage

  add_id_element(:div, /WELCOME TO SELENIUM EASY DEMO/i, id: 'home')

  add_route(:SimpleFormDemoPage, :to_simple_form_page)
  add_route(:RadioButtonsDemoPage, :to_radio_buttons_demo_page)
  add_route(:SelectDropdownListPage, :to_select_dropdown_list_page)

  def create_elements; end

end