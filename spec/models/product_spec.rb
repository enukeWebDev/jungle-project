require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do

    # four fields - name, price, quantity, category
    category = Category.create(name: 'shoes')
    @product = category.products.new(
      name: 'Air Jordan 11',
      price: '3500.50',
      quantity: 2,
    )

    it 'should validate successfully when products has all four fields' do
      expect(@product).to be_valid
    end

    it 'should fail validation if name field is missing' do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it 'should fail validation if price field is missing' do
      @product.price = nil
      expect(@product).to_not be_valid
    end

    it 'should fail validation if quantity field is missing' do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it 'should fail validation if category field is missing' do
      @product.category = nil
      expect(@product).to_not be_valid
    end
      
  end
end
