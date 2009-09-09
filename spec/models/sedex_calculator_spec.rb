require File.dirname(__FILE__) + '/../spec_helper'

describe "SedexCalculator" do

  before(:each) do
    @calculator = SedexCalculator.new
    @ws = mock_model CalcPrecoPrazoWSSoap
    CalcPrecoPrazoWSSoap.stub(:new).with(no_args()).and_return(@ws)
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
    variant = mock_model Variant, :weight => nil
    line_item = mock_model LineItem, :variant => variant

    result = @calculator.compute [line_item]
    assert_equal 0, result
  end

  it "should return the ws result based on the weight sum" do
    variant = mock_model Variant, :weight => 1
    line_item = mock_model LineItem, :variant => variant

    valor = mock 'valor', :valor => 6
    calcPrecoPrazoResult = mock 'calcPrecoPrazoResult', :servicos => [valor]
    result = mock 'result', :calcPrecoPrazoResult => calcPrecoPrazoResult

    @ws.stub!(:calcPrecoPrazo).with(hash_including(:nVlPeso => '1')).and_return(result)

    assert_equal 6, @calculator.compute([line_item])

  end

end

