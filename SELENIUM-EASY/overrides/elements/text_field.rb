class TextFieldElement < CoreElement

  def validate(data)
    super(data)
    if active
      message = data == '' ? "Checking that [#{@name}] is [empty]" : "Checking that [#{@name}] contains [#{data}]"
      validation_point = @world.validation_engine.add_validation_point(message)
      if value == data
        validation_point.pass
      else
        validation_point.fail("ERROR! [#{@name}] has incorrect value!\n\tFOUND   : #{value.inspect}\n\tEXPECTED: #{data.inspect}")
      end
    end
  end

end