class SeleniumEasyRootPage < CorePage

  def begin_new_session
    browser.goto(@world.configuration['ENVIRONMENT']["URL"])
    @world.assert_and_set_page(DemoHomePage)
  end

  def create_common_elements
    create_navigation
  end

  def create_navigation
    navigation_top_level = group(
        input_forms_nav = add_button(:input_forms_nav, element_type: :link, xpath: '//*[@id="navbar-brand-centered"]/ul[1]/li[1]/a')
    )

    input_forms_group = group(
      add_button(:simple_form_demo_nav, element_type: :link, xpath: '//*[@id="navbar-brand-centered"]/ul[1]/li[1]/ul/li[1]/a'),
      add_button(:checkbox_demo_nav, element_type: :link, xpath: '//*[@id="navbar-brand-centered"]/ul[1]/li[1]/ul/li[2]/a'),
      add_button(:radio_buttons_demo_nav, element_type: :link, xpath: '//*[@id="navbar-brand-centered"]/ul[1]/li[1]/ul/li[3]/a'),
      add_button(:select_dropdown_list_nav, element_type: :link, xpath: '//*[@id="navbar-brand-centered"]/ul[1]/li[1]/ul/li[4]/a')
    )
    input_forms_group.deactivate

    input_forms_nav.on_click do
      input_forms_group.activate
    end
  end

  def to_simple_form_page
    click_nav(:input_forms_nav_button, :simple_form_demo_nav_button)
  end

  def click_nav(top_level, link)
    click_on(top_level)
    click_on(link)
  end

end