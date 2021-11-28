require 'rails_helper'

RSpec.describe "質問", type: :request do
  let(:customer) { create(:customer) }
  let(:question) { create(:question) }
  let(:question_params) { attributes_for(:question) }

  context "投稿" do
    it "質問情報入力" do
      get new_question_path, params: {question: question_params }
      expect(response.status).to eq 200
    end
  end
end