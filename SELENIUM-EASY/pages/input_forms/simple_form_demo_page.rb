class SimpleFormDemoPage < SeleniumEasyRootPage

  add_id_element(:h3, /This would be your first example to start with Selenium./i, xpath: '//*[@id="easycont"]/div/div[2]/h3')

  def create_elements
    message = add_text_field(:message, id: 'user-message')
    show_message = add_button(:show_message, xpath: '//*[@id="get-input"]/button')
    message_display = add_static_text(:message_display, element_type: :span, id: 'display')
    message_display.deactivate

    show_message.on_click do
      message_display.activate
      value = @world.ledger.get_value(self.class, message.name)
      @world.ledger.record_fill(message_display.name, value)
    end

    value_1 = add_text_field(:value_1, id: 'sum1')
    value_2 = add_text_field(:value_2, id: 'sum2')
    get_total = add_button(:get_total, xpath: '//*[@id="gettotal"]/button')
    value_display = add_static_text(:value_display, element_type: :span, id: 'displayvalue')
    value_display.deactivate

    get_total.on_click do
      value_display.activate
      number_1 = Integer(@world.ledger.get_value(self.class, value_1.name)) rescue nil
      number_2 = Integer(@world.ledger.get_value(self.class, value_2.name)) rescue nil
      total = (number_1.nil? || number_2.nil?) ? 'NaN' : number_1 + number_2
      @world.ledger.record_fill(value_display.name, total)
    end

  end

end