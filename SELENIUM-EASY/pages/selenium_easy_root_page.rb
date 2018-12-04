class SeleniumEasyRootPage < CorePage

  def begin_new_session
    browser.goto(@world.configuration['ENVIRONMENT']["URL"])
    @world.assert_and_set_page(DemoHomePage)
  end

  def create_common_elements
    create_navigation
  end

  def create_navigation; end

end