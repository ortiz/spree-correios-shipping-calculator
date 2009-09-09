require File.dirname(__FILE__) + '/../spec_helper'

describe "SedexCalculator", "When there is no weight" do

  before(:each) do
    @calculator = SedexCalculator.new
    CalcPrecoPrazoWSSoap.should_not_receive(:new)
  end

  it "should return zero when compute receive nil" do
    result = @calculator.compute nil
    assert_equal 0, result
  end

  it "should return zero when compute receive an empty array" do
    result = @calculator.compute []
    assert_equal 0, result
  end

  it "should return zero when compute receive products whithout weight" do
    result = @calculator.compute [mock_line_item :weight => nil]
    assert_equal 0, result
  end

end

describe "SedexCalculator", "When there is weight" do

  before(:each) do
    @calculator = SedexCalculator.new
    @ws = mock_model CalcPrecoPrazoWSSoap
    CalcPrecoPrazoWSSoap.stub(:new).with(no_args()).and_return(@ws)

    valor = mock 'valor', :valor => @valor_ws_esperado
    calcPrecoPrazoResult = mock 'calcPrecoPrazoResult', :servicos => [valor]
    @result = mock 'result', :calcPrecoPrazoResult => calcPrecoPrazoResult
  end

  it "should return the ws result based on the weight sum of one variant" do
    @ws.should_receive(:calcPrecoPrazo).with(hash_including(:nVlPeso => '1')).and_return(@result)

    line_item = mock_line_item :weight => 1

    assert_equal @valor_ws_esperado, @calculator.compute([line_item])
  end

  it "should return the ws result based on the weight sum of two different variants" do
    @ws.should_receive(:calcPrecoPrazo).with(hash_including(:nVlPeso => '10')).and_return(@result)

    ipod = mock_line_item :weight => 6
    wii = mock_line_item :weight => 4

    assert_equal @valor_ws_esperado, @calculator.compute([ipod, wii])
  end

  it "should return the ws result based on the weight sum of one variant where the quantity is two" do
    @ws.should_receive(:calcPrecoPrazo).with(hash_including(:nVlPeso => '12')).and_return(@result)

    ipod = mock_line_item :weight => 6, :quantity => 2

    assert_equal @valor_ws_esperado, @calculator.compute([ipod])
  end

  it "should send default parameters" do
    parameters = {
      :nCdEmpresa => '',
      :sDsSenha => '',
      :nCdServico => '40010', # Código do Sedex
      :sCdMaoPropria => 'N',
      :sCdAvisoRecebimento => 'N'
    }

    @ws.should_receive(:calcPrecoPrazo).with(hash_including(parameters)).and_return(@result)

    @calculator.compute([mock_line_item(:weight => 5)])
  end

  it "should use the preferred_cep_origem" do
    @calculator.should_receive(:preferred_cep_origem).and_return('04543900')

    @ws.should_receive(:calcPrecoPrazo).with(hash_including(:sCepOrigem => '04543900')).and_return(@result)

    @calculator.compute([mock_line_item(:weight => 4)])
  end

end

private

  def mock_line_item(options)

    defaults = {:weight => 0, :quantity => 1}

    options = defaults.merge options

    variant = mock_model Variant, :weight => options[:weight]
    line_item = mock_model LineItem, :variant => variant, :quantity => options[:quantity]

  end

