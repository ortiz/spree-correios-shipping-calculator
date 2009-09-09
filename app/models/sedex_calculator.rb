class SedexCalculator < Calculator
preference :cep_origem, :string

  def compute(order=nil)
    return 0 if order.nil? || order.empty?

    peso_total = order.sum do |item|
      item.variant.weight ? item.variant.weight * item.quantity : 0
    end

    return 0 if peso_total == 0

    parameters = {
      :nCdEmpresa => '',
      :sDsSenha => '',
      :nCdServico => '40010', # Código do Sedex
      :sCdMaoPropria => 'N',
      :sCdAvisoRecebimento => 'N',
      :nVlPeso => peso_total.to_s,
      :sCepOrigem => preferred_cep_origem
    }

    ws = CalcPrecoPrazoWSSoap.new
    result = ws.calcPrecoPrazo parameters
    result.calcPrecoPrazoResult.servicos.first.valor

  end
end

