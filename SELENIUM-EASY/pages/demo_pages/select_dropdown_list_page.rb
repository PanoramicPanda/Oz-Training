class SelectDropdownListPage < SeleniumEasyRootPage

  add_id_element(:h3, /This would be your first example on select dropd down list to with Selenium/i, xpath: '//*[@id="easycont"]/div/div[2]/h3')

  def create_elements
    day = add_select_list(:day, id: 'select-demo')
    day_display = add_static_text(:day_display, element_type: :p, xpath: '//*[@id="easycont"]/div/div[2]/div[1]/div[2]/p[2]')
    day_display.deactivate

    day.on_fill do
      day_display.activate_if(day.value != 'Select One')
      if day_display.active?
        @world.ledger.record_fill(day_display.name, "Day selected :- #{@world.ledger.get_value(self.class, day.name)}")
      end
    end
  end

end