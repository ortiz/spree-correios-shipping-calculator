#!/usr/bin/env ruby
require "#{RAILS_ROOT}/vendor/extensions/correios_shipping_calculator/lib/webservice/defaultDriver.rb"

endpoint_url = ARGV.shift
obj = CalcPrecoPrazoWSSoap.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   CalcPrecoPrazo(parameters)
#
# ARGS
#   parameters      CalcPrecoPrazo - {http://tempuri.org/}CalcPrecoPrazo
#
# RETURNS
#   parameters      CalcPrecoPrazoResponse - {http://tempuri.org/}CalcPrecoPrazoResponse
#
parameters = nil
puts obj.calcPrecoPrazo(parameters)


endpoint_url = ARGV.shift
obj = CalcPrecoPrazoWSHttpGet.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   CalcPrecoPrazo(nCdEmpresa, sDsSenha, nCdServico, sCepOrigem, sCepDestino, nVlPeso, nCdFormato, nVlComprimento, nVlAltura, nVlLargura, nVlDiametro, sCdMaoPropria, nVlValorDeclarado, sCdAvisoRecebimento)
#
# ARGS
#   nCdEmpresa      C_String - {http://www.w3.org/2001/XMLSchema}string
#   sDsSenha        C_String - {http://www.w3.org/2001/XMLSchema}string
#   nCdServico      C_String - {http://www.w3.org/2001/XMLSchema}string
#   sCepOrigem      C_String - {http://www.w3.org/2001/XMLSchema}string
#   sCepDestino     C_String - {http://www.w3.org/2001/XMLSchema}string
#   nVlPeso         C_String - {http://www.w3.org/2001/XMLSchema}string
#   nCdFormato      C_String - {http://www.w3.org/2001/XMLSchema}string
#   nVlComprimento  C_String - {http://www.w3.org/2001/XMLSchema}string
#   nVlAltura       C_String - {http://www.w3.org/2001/XMLSchema}string
#   nVlLargura      C_String - {http://www.w3.org/2001/XMLSchema}string
#   nVlDiametro     C_String - {http://www.w3.org/2001/XMLSchema}string
#   sCdMaoPropria   C_String - {http://www.w3.org/2001/XMLSchema}string
#   nVlValorDeclarado C_String - {http://www.w3.org/2001/XMLSchema}string
#   sCdAvisoRecebimento C_String - {http://www.w3.org/2001/XMLSchema}string
#
# RETURNS
#   body            CResultado - {http://tempuri.org/}cResultado
#
nCdEmpresa = sDsSenha = nCdServico = sCepOrigem = sCepDestino = nVlPeso = nCdFormato = nVlComprimento = nVlAltura = nVlLargura = nVlDiametro = sCdMaoPropria = nVlValorDeclarado = sCdAvisoRecebimento = nil
puts obj.calcPrecoPrazo(nCdEmpresa, sDsSenha, nCdServico, sCepOrigem, sCepDestino, nVlPeso, nCdFormato, nVlComprimento, nVlAltura, nVlLargura, nVlDiametro, sCdMaoPropria, nVlValorDeclarado, sCdAvisoRecebimento)

