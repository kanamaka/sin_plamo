require 'rails_helper'

RSpec.describe "新規登録", type: :request do
  let(:customer) { create(:customer) }
  let(:customer_params) { attributes_for(:customer) }
  # let(:invalid_customer_params) { attributes_for(:customer, name: "") }
  # before do
  #   @customer = FactoryBot.create(:customer)
  # end

  context "新規登録" do
    it "新規登録情報入力" do
      post customer_registration_path, params: {customer: customer_params }
      expect(response.status).to eq 302
    end
  end
  context 'titleカラム' do
      it '空欄でないこと' do
        customer.name = ''
        expect(customer).to be_invalid;
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        customer.email = ''
        expect(customer).to be_invalid;
      end
    end
    context 'encrypted_passwordカラム' do
      it '空欄でないこと' do
        customer.password = ''
        expect(customer).to be_invalid;
      end
    end
end