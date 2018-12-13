class RadioButtonsDemoPage < SeleniumEasyRootPage

  add_id_element(:h3, /This is again simple example to start working with radio buttons using Selenium/i, xpath: '//*[@id="easycont"]/div/div[2]/h3')

  def create_elements
    male = add_radio_button(:male, xpath: '//*[@id="easycont"]/div/div[2]/div[1]/div[2]/label[1]/input')
    female = add_radio_button(:female, xpath: '//*[@id="easycont"]/div/div[2]/div[1]/div[2]/label[2]/input')
    get_checked_value = add_button(:get_checked_value, id: 'buttoncheck')
    rb_demo_display = add_static_text(:rb_demo_display, element_type: :p, xpath: '//*[@id="easycont"]/div/div[2]/div[1]/div[2]/p[3]')
    rb_demo_display.deactivate

    male.on_fill do
      @world.ledger.record_fill(female.name, 'unselected')
    end

    female.on_fill do
      @world.ledger.record_fill(male.name, 'unselected')
    end

    get_checked_value.on_click do
      rb_demo_display.activate
      case @world.ledger.get_value(self.class, male.name)
      when 'unselected'
        message = "Radio button 'Female' is checked"
      when 'selected'
        message = "Radio button 'Male' is checked"
      else
        message = 'Radio button is Not checked'
      end
      @world.ledger.record_fill(rb_demo_display.name, message)
    end

    create_group_radio_buttons_demo

  end

  def create_group_radio_buttons_demo
    group_age_0_5 = add_radio_button(:group_age_0_5, xpath: '//*[@id="easycont"]/div/div[2]/div[2]/div[2]/div[2]/label[1]/input')
    group_age_5_15 = add_radio_button(:group_age_5_15, xpath: '//*[@id="easycont"]/div/div[2]/div[2]/div[2]/div[2]/label[2]/input')
    group_age_15_50 = add_radio_button(:group_age_15_50, xpath: '//*[@id="easycont"]/div/div[2]/div[2]/div[2]/div[2]/label[3]/input')

    get_group_values = add_button(:get_group_values, text: 'Get values')

    group_text = add_static_text(:group_text, element_type: :p, id: 'groupradiobutton')
    group_text.deactivate

    group_age_0_5.on_fill do
      @world.ledger.record_fill(group_age_5_15.name, 'unselected')
      @world.ledger.record_fill(group_age_15_50.name, 'unselected')
    end

    group_age_5_15.on_fill do
      @world.ledger.record_fill(group_age_0_5.name, 'unselected')
      @world.ledger.record_fill(group_age_15_50.name, 'unselected')
    end

    group_age_15_50.on_fill do
      @world.ledger.record_fill(group_age_0_5.name, 'unselected')
      @world.ledger.record_fill(group_age_5_15.name, 'unselected')
    end

    get_group_values.on_click do
      group_text.activate

      if @world.ledger.get_value(self.class, group_age_0_5.name) == 'selected'
        age = '0 - 5'
      elsif @world.ledger.get_value(self.class, group_age_0_5.name) == 'selected'
        age = '5 - 15'
      elsif  @world.ledger.get_value(self.class, group_age_0_5.name) == 'selected'
        age = '15 - 50'
      else
        age = ''
      end

      @world.ledger.record_fill(group_text.name, "Sex : \n Age group: #{age}")
    end
  end

end