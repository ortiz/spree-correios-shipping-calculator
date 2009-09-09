# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class CorreiosShippingCalculatorExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/correios_shipping_calculator"

  def self.require_gems(config)
    config.gem "soap4r", :version => '>=1.5.0', :lib => false
  end

  def activate
    require "#{RAILS_ROOT}/vendor/extensions/correios_shipping_calculator/lib/webservice/defaultDriver.rb"
    SedexCalculator.register
  end

end

