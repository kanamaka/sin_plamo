require 'rails_helper'

RSpec.describe "新規投稿", type: :request do
 let(:opu) { create(:opu) }
 let(:opus_params) { attributes_for(:opu) }
 post.opus_path = Refile::FileDouble.new("dummy", "logo.jpg", content_type: "images/png")
    post.save

 context "新規投稿" do
    it "新規登録情報入力" do
      get new_opu_path, params: {opu: opus_params }
      expect(response.status).to eq 200
    end
 end
end
