require "#{RAILS_ROOT}/vendor/extensions/correios_shipping_calculator/lib/webservice/default.rb"
require 'soap/mapping'

module DefaultMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsTempuriOrg = "http://tempuri.org/"

  EncodedRegistry.register(
    :class => CResultado,
    :schema_type => XSD::QName.new(NsTempuriOrg, "cResultado"),
    :schema_element => [
      ["servicos", ["ArrayOfCServico", XSD::QName.new(NsTempuriOrg, "Servicos")], [0, 1]]
    ]
  )

  EncodedRegistry.register(
    :class => ArrayOfCServico,
    :schema_type => XSD::QName.new(NsTempuriOrg, "ArrayOfCServico"),
    :schema_element => [
      ["cServico", "CServico[]", [0, nil]]
    ]
  )

  EncodedRegistry.register(
    :class => CServico,
    :schema_type => XSD::QName.new(NsTempuriOrg, "cServico"),
    :schema_element => [
      ["codigo", ["SOAP::SOAPInt", XSD::QName.new(NsTempuriOrg, "Codigo")]],
      ["valor", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "Valor")], [0, 1]],
      ["prazoEntrega", ["SOAP::SOAPInt", XSD::QName.new(NsTempuriOrg, "PrazoEntrega")]],
      ["valorMaoPropria", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "ValorMaoPropria")], [0, 1]],
      ["valorAvisoRecebimento", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "ValorAvisoRecebimento")], [0, 1]],
      ["valorValorDeclarado", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "ValorValorDeclarado")], [0, 1]],
      ["entregaDomiciliar", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "EntregaDomiciliar")], [0, 1]],
      ["entregaSabado", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "EntregaSabado")], [0, 1]],
      ["erro", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "Erro")], [0, 1]],
      ["msgErro", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "MsgErro")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => CResultado,
    :schema_type => XSD::QName.new(NsTempuriOrg, "cResultado"),
    :schema_element => [
      ["servicos", ["ArrayOfCServico", XSD::QName.new(NsTempuriOrg, "Servicos")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => ArrayOfCServico,
    :schema_type => XSD::QName.new(NsTempuriOrg, "ArrayOfCServico"),
    :schema_element => [
      ["cServico", "CServico[]", [0, nil]]
    ]
  )

  LiteralRegistry.register(
    :class => CServico,
    :schema_type => XSD::QName.new(NsTempuriOrg, "cServico"),
    :schema_element => [
      ["codigo", ["SOAP::SOAPInt", XSD::QName.new(NsTempuriOrg, "Codigo")]],
      ["valor", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "Valor")], [0, 1]],
      ["prazoEntrega", ["SOAP::SOAPInt", XSD::QName.new(NsTempuriOrg, "PrazoEntrega")]],
      ["valorMaoPropria", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "ValorMaoPropria")], [0, 1]],
      ["valorAvisoRecebimento", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "ValorAvisoRecebimento")], [0, 1]],
      ["valorValorDeclarado", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "ValorValorDeclarado")], [0, 1]],
      ["entregaDomiciliar", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "EntregaDomiciliar")], [0, 1]],
      ["entregaSabado", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "EntregaSabado")], [0, 1]],
      ["erro", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "Erro")], [0, 1]],
      ["msgErro", ["SOAP::SOAPString", XSD::QName.new(NsTempuriOrg, "MsgErro")], [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => CalcPrecoPrazo,
    :schema_name => XSD::QName.new(NsTempuriOrg, "CalcPrecoPrazo"),
    :schema_element => [
      ["nCdEmpresa", "SOAP::SOAPString", [0, 1]],
      ["sDsSenha", "SOAP::SOAPString", [0, 1]],
      ["nCdServico", "SOAP::SOAPString", [0, 1]],
      ["sCepOrigem", "SOAP::SOAPString", [0, 1]],
      ["sCepDestino", "SOAP::SOAPString", [0, 1]],
      ["nVlPeso", "SOAP::SOAPDecimal"],
      ["nCdFormato", "SOAP::SOAPInt"],
      ["nVlComprimento", "SOAP::SOAPDecimal"],
      ["nVlAltura", "SOAP::SOAPDecimal"],
      ["nVlLargura", "SOAP::SOAPDecimal"],
      ["nVlDiametro", "SOAP::SOAPDecimal"],
      ["sCdMaoPropria", "SOAP::SOAPString", [0, 1]],
      ["nVlValorDeclarado", "SOAP::SOAPDecimal"],
      ["sCdAvisoRecebimento", "SOAP::SOAPString", [0, 1]]
    ]
  )

  LiteralRegistry.register(
    :class => CalcPrecoPrazoResponse,
    :schema_name => XSD::QName.new(NsTempuriOrg, "CalcPrecoPrazoResponse"),
    :schema_element => [
      ["calcPrecoPrazoResult", ["CResultado", XSD::QName.new(NsTempuriOrg, "CalcPrecoPrazoResult")]]
    ]
  )

  LiteralRegistry.register(
    :class => CResultado,
    :schema_name => XSD::QName.new(NsTempuriOrg, "cResultado"),
    :schema_element => [
      ["servicos", ["ArrayOfCServico", XSD::QName.new(NsTempuriOrg, "Servicos")], [0, 1]]
    ]
  )
end

