class CoreElement

  def present?
    if @world.watir_version
      begin
        watir_element.wait_until_present(timeout:0)
        return true
      rescue Watir::Wait::TimeoutError => e
        return false
      end
    else
      return false unless watir_element.exists?
      begin
        return watir_element.visible?
      rescue Watir::Exception::UnknownObjectException => e
        @world.logger.warn 'Object not found during visibility check, proceeding anyway...'
        return false
      end
    end
  end

end