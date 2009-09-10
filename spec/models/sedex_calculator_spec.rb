require File.dirname(__FILE__) + '/../spec_helper'

describe "SedexCalculator", "When there is no weight" do

  before(:each) do
    @calculator = SedexCalculator.new
    CalcPrecoPrazoWSSoap.should_not_receive(:new)
  end

  it "should return zero when compute receive nil" do
    result = @calculator.compute nil
    result.should be_equal 0
  end

  it "should return zero when compute receive an empty array" do
    result = @calculator.compute []
    result.should be_equal 0
  end

  it "should return zero when compute receive products whithout weight" do
    result = @calculator.compute [mock_line_item :weight => nil]
    result.should be_equal 0
  end

end

describe "SedexCalculator", "When there is weight" do

  before(:each) do
    @calculator = SedexCalculator.new
    @ws = mock_model CalcPrecoPrazoWSSoap
    CalcPrecoPrazoWSSoap.stub(:new).with(no_args()).and_return(@ws)

    obj = Object.new
    calcPrecoPrazoResult = Object.new
    @preco_obtido_pelo_ws = 5

    @ws_response.stub(:calcPrecoPrazoResult).with(no_args()).and_return(calcPrecoPrazoResult)
    calcPrecoPrazoResult.stub(:servicos).with(no_args()).and_return([obj])
    obj.stub(:valor).with(no_args()).and_return(@preco_obtido_pelo_ws)
    obj.stub(:erro).with(no_args()).and_return('0')

  end

  it "should return the ws result based on the weight sum of one variant" do
    @ws.should_receive(:calcPrecoPrazo).with(hash_including(:nVlPeso => '1')).and_return(@ws_response)

    line_item = mock_line_item :weight => 1

    @preco_obtido_pelo_ws.should be_equal @calculator.compute([line_item])
  end

  it "should return the ws result based on the weight sum of two different variants" do
    @ws.should_receive(:calcPrecoPrazo).with(hash_including(:nVlPeso => '10')).and_return(@ws_response)

    ipod = mock_line_item :weight => 6
    wii = mock_line_item :weight => 4

    @preco_obtido_pelo_ws.should be_equal @calculator.compute([ipod, wii])
  end

  it "should return the ws result based on the weight sum of one variant where the quantity is two" do
    @ws.should_receive(:calcPrecoPrazo).with(hash_including(:nVlPeso => '12')).and_return(@ws_response)

    ipod = mock_line_item :weight => 6, :quantity => 2

    @preco_obtido_pelo_ws.should be_equal @calculator.compute([ipod])
  end

  it "should send default parameters" do
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
      :sCdAvisoRecebimento => 'N'
    }

    @ws.should_receive(:calcPrecoPrazo).with(hash_including(parameters)).and_return(@ws_response)

    @calculator.compute([mock_line_item(:weight => 5)])
  end

  it "should use the preferred_cep_origem" do
    @calculator.should_receive(:preferred_zipcode).and_return('04543900')

    @ws.should_receive(:calcPrecoPrazo).with(hash_including(:sCepOrigem => '04543900')).and_return(@ws_response)

    @calculator.compute([mock_line_item(:weight => 4)])
  end

  it "should use order values" do

    cep_destino = '04543900'
    valor_declarado = '10'

    parameters = {
      :sCepDestino => cep_destino,
      :nVlValorDeclarado => valor_declarado
    }

    @ws.should_receive(:calcPrecoPrazo).with(hash_including(parameters)).and_return(@ws_response)

    ipod = mock_line_item :weight => 6, :order => mock_order(:zipcode => cep_destino, :total => valor_declarado)
    wii = mock_line_item :weight => 4, :order => mock_order(:zipcode => cep_destino, :total => valor_declarado)

    @preco_obtido_pelo_ws.should be_equal @calculator.compute([ipod, wii])
  end

  it "should return the webservice result" do
    @ws.should_receive(:calcPrecoPrazo).with(hash_including(:nVlPeso => "9")).and_return(@ws_response)
    @preco_obtido_pelo_ws.should be_equal @calculator.compute([mock_line_item(:weight => 9)])
  end

end

describe "SedexCalculator", "WebService Error" do

  #-1 Código de serviço inválido
  #-2 CEP de origem inválido
  #-3 CEP de destino inválido
  #-4 Peso excedido
  #-5 O Valor Declarado não deve exceder R$ 10.000,00

  before(:each) do
    @calculator = SedexCalculator.new
    @ws = mock_model CalcPrecoPrazoWSSoap
    CalcPrecoPrazoWSSoap.stub(:new).with(no_args()).and_return(@ws)

    @return = Object.new
    calcPrecoPrazoResult = Object.new
    @preco_obtido_pelo_ws = 5

    @ws_response.stub(:calcPrecoPrazoResult).with(no_args()).and_return(calcPrecoPrazoResult)
    calcPrecoPrazoResult.stub(:servicos).with(no_args()).and_return([@return])

  end

  it "should return the error message when over weight" do
    mock_error '-4', 'Peso excedido'

    @ws.should_receive(:calcPrecoPrazo).with(anything()).and_return(@ws_response)
    "Peso excedido".should == @calculator.compute([mock_line_item(:weight => 9)])
  end


end

private

def mock_line_item(options)

  defaults = {:weight => 0, :quantity => 1, :order => mock_order}

  options = defaults.merge options

  variant = Object.new
  line_item = Object.new

  line_item.stub(:variant).with(no_args()).and_return(variant)
  line_item.stub(:quantity).with(no_args()).and_return(options[:quantity])
  line_item.stub(:order).with(no_args()).and_return(options[:order])

  variant.stub(:weight).with(no_args()).and_return(options[:weight])

  line_item

end

def mock_order(options={})

  defaults = {:zipcode => '04543900', :total => '10'}

  options = defaults.merge options

  address = Object.new
  shipment = Object.new
  order = Object.new

  address.stub(:zipcode).with(no_args()).and_return(options[:zipcode])
  shipment.stub(:address).with(no_args()).and_return(address)
  order.stub(:shipment).with(no_args()).and_return(shipment)
  order.stub(:total).with(no_args()).and_return(options[:total])

  order

end

def mock_error(error_code, error_message)

    @return.stub(:erro).with(no_args()).and_return(error_code)
    @return.stub(:msgErro).with(no_args()).and_return(error_message)
end

