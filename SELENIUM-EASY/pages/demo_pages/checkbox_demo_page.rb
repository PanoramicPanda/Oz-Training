class CheckboxDemoPage < SeleniumEasyRootPage

  add_id_element(:h3, /This would be a basic example to start with checkboxes using selenium/i, xpath: '//*[@id="easycont"]/div/div[2]/h3')

  def create_elements
    toggle = add_checkbox(:toggle, id: 'isAgeSelected')
    success_message = add_static_text(:success_message, id: 'txtAge')
    success_message.deactivate

    toggle.on_fill do
      success_message.activate_if(toggle.value == 'checked')
    end
  end
end