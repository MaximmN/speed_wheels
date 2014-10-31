require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products
  # test "the truth" do
  #   assert true
  # end
#=begin
	test "product attributes must not be empty" do
		# свойства товара не должны оставаться пустыми
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
	end
#end
#=end
# test asserts приемлемости
	test "product price must be positive" do
		# цена товара должна быть положительной
		product = Product.new(title: "My Book Title",
							description: "yyy",
							image_url: "zzz.jpg")
		product.price = -1
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"],
		
		product.errors[:price]
			# должна быть больше или равна 0.01
		product.price = 0

		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"],
			product.errors[:price]
		product.price = 1
		assert product.valid?
	end
end