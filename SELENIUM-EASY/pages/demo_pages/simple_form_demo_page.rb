class SimpleFormDemoPage < SeleniumEasyRootPage

  add_id_element(:h3, /This would be your first example to start with Selenium./i, xpath: '//*[@id="easycont"]/div/div[2]/h3')

  def create_elements; end

end