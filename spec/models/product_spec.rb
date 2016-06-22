require 'rails_helper'

describe Product do
  context "when the product has comments" do
  	before do
  	  @product = Product.create!(name: "Snake ring")
  	  @user = User.create!(email: "ana.afonso.01@gmail.com", password: "123456")
  	  @product.comments.create!(rating: 1, user: @user, body: "Awful!")
  	  @product.comments.create!(rating: 5, user: @user, body: "Beautiful!")
  	  @product.comments.create!(rating: 3, user: @user, body: "It's ok.")
	end

	it "returns the average rating of all comments" do
		expect(@product.comments.average(:rating)).to eq 3
	end

	it "is not valid" do
		expect(Product.new(description: "Nice ring")).not_to be_valid
	end

  end

  
end