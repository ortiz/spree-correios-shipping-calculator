class SedexCalculator < Calculator

  def compute(order=nil)
    return 0 if order.nil? || order.empty?

    peso_total = order.sum do |item|
      item.variant.weight ? item.variant.weight : 0
    end

    return 0 if peso_total == 0

    ws = CalcPrecoPrazoWSSoap.new
    result = ws.calcPrecoPrazo :nVlPeso => '1'
    result.calcPrecoPrazoResult.servicos.first.valor

  end
end

