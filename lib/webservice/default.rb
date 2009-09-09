require 'xsd/qname'

# {http://tempuri.org/}cResultado
#   servicos - ArrayOfCServico
class CResultado
  attr_accessor :servicos

  def initialize(servicos = nil)
    @servicos = servicos
  end
end

# {http://tempuri.org/}ArrayOfCServico
class ArrayOfCServico < ::Array
end

# {http://tempuri.org/}cServico
#   codigo - SOAP::SOAPInt
#   valor - SOAP::SOAPString
#   prazoEntrega - SOAP::SOAPInt
#   valorMaoPropria - SOAP::SOAPString
#   valorAvisoRecebimento - SOAP::SOAPString
#   valorValorDeclarado - SOAP::SOAPString
#   entregaDomiciliar - SOAP::SOAPString
#   entregaSabado - SOAP::SOAPString
#   erro - SOAP::SOAPString
#   msgErro - SOAP::SOAPString
class CServico
  attr_accessor :codigo
  attr_accessor :valor
  attr_accessor :prazoEntrega
  attr_accessor :valorMaoPropria
  attr_accessor :valorAvisoRecebimento
  attr_accessor :valorValorDeclarado
  attr_accessor :entregaDomiciliar
  attr_accessor :entregaSabado
  attr_accessor :erro
  attr_accessor :msgErro

  def initialize(codigo = nil, valor = nil, prazoEntrega = nil, valorMaoPropria = nil, valorAvisoRecebimento = nil, valorValorDeclarado = nil, entregaDomiciliar = nil, entregaSabado = nil, erro = nil, msgErro = nil)
    @codigo = codigo
    @valor = valor
    @prazoEntrega = prazoEntrega
    @valorMaoPropria = valorMaoPropria
    @valorAvisoRecebimento = valorAvisoRecebimento
    @valorValorDeclarado = valorValorDeclarado
    @entregaDomiciliar = entregaDomiciliar
    @entregaSabado = entregaSabado
    @erro = erro
    @msgErro = msgErro
  end
end

# {http://tempuri.org/}CalcPrecoPrazo
#   nCdEmpresa - SOAP::SOAPString
#   sDsSenha - SOAP::SOAPString
#   nCdServico - SOAP::SOAPString
#   sCepOrigem - SOAP::SOAPString
#   sCepDestino - SOAP::SOAPString
#   nVlPeso - SOAP::SOAPDecimal
#   nCdFormato - SOAP::SOAPInt
#   nVlComprimento - SOAP::SOAPDecimal
#   nVlAltura - SOAP::SOAPDecimal
#   nVlLargura - SOAP::SOAPDecimal
#   nVlDiametro - SOAP::SOAPDecimal
#   sCdMaoPropria - SOAP::SOAPString
#   nVlValorDeclarado - SOAP::SOAPDecimal
#   sCdAvisoRecebimento - SOAP::SOAPString
class CalcPrecoPrazo
  attr_accessor :nCdEmpresa
  attr_accessor :sDsSenha
  attr_accessor :nCdServico
  attr_accessor :sCepOrigem
  attr_accessor :sCepDestino
  attr_accessor :nVlPeso
  attr_accessor :nCdFormato
  attr_accessor :nVlComprimento
  attr_accessor :nVlAltura
  attr_accessor :nVlLargura
  attr_accessor :nVlDiametro
  attr_accessor :sCdMaoPropria
  attr_accessor :nVlValorDeclarado
  attr_accessor :sCdAvisoRecebimento

  def initialize(nCdEmpresa = nil, sDsSenha = nil, nCdServico = nil, sCepOrigem = nil, sCepDestino = nil, nVlPeso = nil, nCdFormato = nil, nVlComprimento = nil, nVlAltura = nil, nVlLargura = nil, nVlDiametro = nil, sCdMaoPropria = nil, nVlValorDeclarado = nil, sCdAvisoRecebimento = nil)
    @nCdEmpresa = nCdEmpresa
    @sDsSenha = sDsSenha
    @nCdServico = nCdServico
    @sCepOrigem = sCepOrigem
    @sCepDestino = sCepDestino
    @nVlPeso = nVlPeso
    @nCdFormato = nCdFormato
    @nVlComprimento = nVlComprimento
    @nVlAltura = nVlAltura
    @nVlLargura = nVlLargura
    @nVlDiametro = nVlDiametro
    @sCdMaoPropria = sCdMaoPropria
    @nVlValorDeclarado = nVlValorDeclarado
    @sCdAvisoRecebimento = sCdAvisoRecebimento
  end
end

# {http://tempuri.org/}CalcPrecoPrazoResponse
#   calcPrecoPrazoResult - CResultado
class CalcPrecoPrazoResponse
  attr_accessor :calcPrecoPrazoResult

  def initialize(calcPrecoPrazoResult = nil)
    @calcPrecoPrazoResult = calcPrecoPrazoResult
  end
end
