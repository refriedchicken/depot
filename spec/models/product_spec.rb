require 'rails_helper'

RSpec.describe Product, type: :model do
  context "product validations" do
    it "attributes must not be empty" do
      product = Product.new
      expect(product.invalid?).to be_truthy
      expect(product.errors[:title].any?).to be_truthy
      expect(product.errors[:price].any?).to be_truthy
      expect(product.errors[:image_url].any?).to be_truthy
      expect(product.errors[:description].any?).to be_truthy
    end

    it "price must be a positive value" do
      product = Product.new( title: "My Title",
                             description: "Best book",
                             image_url: "test.png")
      product.price = -1
      expect(product.invalid?).to be_truthy
      expect(product.errors[:price]).to eq(["must be greater than or equal to 0.01"])

      product.price = 0
      expect(product.invalid?).to be_truthy
      expect(product.errors[:price]).to eq(["must be greater than or equal to 0.01"])

      product.price = 1
      expect(product.valid?).to be_truthy
    end
  end
end
