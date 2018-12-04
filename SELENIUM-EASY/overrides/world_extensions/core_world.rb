module CoreWorld

  attr_accessor :browser, :configuration, :ledger, :router, :data_engine, :browser_engine, :validation_engine, :watir_version
  attr_reader :root_page, :data_target, :logger

  def create_world
    @configuration = ConfigurationEngine.new
    @logger = OzLogger.new(self)
    @data_engine = DataEngine.new(@logger)
    @ledger = Ledger.new(self)
    @router = Router.new(self)
    @browser_engine = BrowserEngine.new(self)
    @validation_engine = ValidationEngine.new(self)
    @watir_version = Gem.loaded_specs['watir'].version >= Gem::Version.create('6.12')
    log_header
    set_data_target
    set_default_watir_timeout
  end

end