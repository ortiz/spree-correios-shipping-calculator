# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class CorreiosShippingCalculatorExtension < Spree::Extension
  version "1.0"
  description "Extensão do Spree para utilização do Sedex (WebService dos Correios)"
  url "http://github.com/ortiz/spree-correios-shipping-calculator/"

  def self.require_gems(config)
    config.gem "soap4r", :version => '>=1.5.0', :lib => false
  end

  def activate
    require "#{RAILS_ROOT}/vendor/extensions/correios_shipping_calculator/lib/webservice/defaultDriver.rb"
    SedexCalculator.register
  end

end

