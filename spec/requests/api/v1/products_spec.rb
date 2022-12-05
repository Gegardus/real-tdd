require 'rails_helper'

RSpec.describe "Products endpoints", request: true do
  describe "POST /api/v1/products" do 
    context "when all parameters are provided" do
      it "creates a product" do 
        params = {
          product: {
              name: "Grace",
              description: "God's inexhaustible gift",
              price: 00000000
        }
      }

        expect do
          post api_v1_products_url, params: params
        end.to change(Product, :count).by(1)
      end

      it "persists the values given as params" do 
        params = {
          product: {
              name: "Grace",
              description: "God's inexhaustible gift",
              price: 00000000
        }
      }

        post api_v1_products_url, params: params
        product = Product.last
        expect(product.name).to eq("Grace")
        expect(product.description).to eq("God's inexhaustible gift")
        expect(product.price).to eq(00000000)
      end

      context "when price is negative" do
        it "does not persist the product" do 
          params = {
            product: {
                name: "Grace",
                description: "God's inexhaustible gift",
                price: -00000001
          }
        }
  
          expect do
            post api_v1_products_url, params: params
          end.not_to change(Product, :count)
        end
      end
    end
  end
end  