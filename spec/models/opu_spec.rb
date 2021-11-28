require "rails_helper"
require "refile/file_double"

RSpec.describe "新規投稿", type: :request do
 let(:customer) { create(:customer) }
 let(:opu) { create(:opu) }
 let(:opus_params) { attributes_for(:opu) }

 context "画像登録" do
    it "複数画像投稿" do
      opu = Opu.new
      opu.image = Refile::FileDouble.new("dummy", "logo.jpg", content_type: "image/jpg")
      # opu.image = Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/logo.jpg'), 'app/assets/images/logo.jpg')
      opu.customer_id = customer.id
      opu.opus_name = "test"
      opu.opus_explanation = "test"
      opu.save!

      expect(opu.image_id).not_to be_nil
    end
 end


  context "新規投稿" do
    it "新規登録情報入力" do
     get new_opu_path, params: {opu: opus_params }
  expect(response.status).to eq 200
    end
  end
end
