

ENV['OZ_APP_NAME'] = 'SELENIUM-EASY'
ENV['OZ_CONFIG_DIR'] = "#{File.dirname(__FILE__)}/config"

require_relative '../CORE/setup.rb'

require_all('../SELENIUM-EASY/overrides/elements')
require_all('../SELENIUM-EASY/overrides/world_extensions')

require_relative '../SELENIUM-EASY/pages/selenium_easy_root_page.rb'
recursively_require_all_base_pages('../SELENIUM-EASY/pages')
recursively_require_all_edge_pages('../SELENIUM-EASY/pages')

require_all('../SELENIUM-EASY/step_definitions') if defined?(Cucumber)