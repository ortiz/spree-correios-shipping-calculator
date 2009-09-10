class SedexCalculator < Calculator
preference :zipcode, :string

  def self.description
    "Sedex"
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def compute(line_items=nil)
    return 0 if line_items.nil? || line_items.empty?

    total_weight = line_items.sum do |item|
      item.variant.weight ? item.variant.weight * item.quantity : 0
    end

    return 0 if total_weight == 0

    parameters = {
      :nCdEmpresa => '',
      :sDsSenha => '',
      :nCdServico => '40010', # Código do Sedex
      :nCdFormato => 0.to_s,
      :nVlComprimento => 0.to_s,
      :nVlAltura => 0.to_s,
      :nVlLargura => 0.to_s,
      :nVlDiametro => 0.to_s,
      :sCdMaoPropria => 'N',
      :sCdAvisoRecebimento => 'N',
      :nVlPeso => total_weight.to_s,
      :sCepOrigem => preferred_zipcode,
      :sCepDestino => line_items.first.order.shipment.address.zipcode.to_s,
      :nVlValorDeclarado => line_items.first.order.total.to_s
    }

    ws = CalcPrecoPrazoWSSoap.new
    result = ws.calcPrecoPrazo parameters
    return result.calcPrecoPrazoResult.servicos.first.msgErro if result.calcPrecoPrazoResult.servicos.first.erro != '0'
    result.calcPrecoPrazoResult.servicos.first.valor

  end
end

