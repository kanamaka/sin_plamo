require 'rails_helper'

RSpec.describe "新規投稿", type: :request do
 let(:opu) { create(:opu) }
 let(:opu_params) { attributes_for(:opu) }
 let(:opu) { FactoryBot.create(:opu) }
 
 context "新規投稿" do
    it "新規登録情報入力" do
      post new_opu_path, params: {opu: opu_params }
      expect(response.status).to eq 302
    end
 end
end
