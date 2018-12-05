class SelectListElement < CoreElement

  def validate(data)
    super(data)
    if active
      validation_point = @world.validation_engine.add_validation_point("Checking that [#{@name}] has [#{data}] selected")
      if value == data
        validation_point.pass
      else
        validation_point.fail("ERROR! [#{@name}] has incorrect value!\n\tFOUND   : #{value.inspect}\n\tEXPECTED: #{data.inspect}")
      end
    end
  end

end