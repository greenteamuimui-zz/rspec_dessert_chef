require 'rspec'
require 'dessert'

describe Dessert do
  subject(:dessert) {Dessert.new("custard",10,chef)}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("custard")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("custard","ten","chef")}.to raise_error ArgumentError
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("egg")
      expect(dessert.ingredients).to include("egg")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      old = @ingredients
      expect(dessert.mix!).to_not eq(old)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(4)
      expect(dessert.quantity).to eq(6)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(11)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize)
      dessert.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
