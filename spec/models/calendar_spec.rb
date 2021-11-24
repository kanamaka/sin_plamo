require 'rails_helper'

RSpec.describe "新規投稿", type: :request do
  #before { create(:customer) }
  let(:customer) { create(:customer) }
  # before { create(:customer) }
  #let!(:customer_article) { create(:article, customer: customer) }
  let(:calendar) { create(:calendar, customer: customer) }
  let(:calendars_params) { attributes_for(:calendar) }

  context "新規投稿(カレンダー)" do
    it "新規情報入力" do
      sign_in customer
      get calendar_path(id: calendar.id)
      expect(response.status).to eq 200
    end
  end

   context 'titleカラム' do
      it '空欄でないこと' do
        calendar.title = ''
        expect(calendar).to be_invalid;
      end
    end

    context 'contentカラム' do
      it '空欄でないこと' do
        calendar.content = ''
        expect(calendar).to be_invalid;
      end
    end

    context 'start_timeカラム' do
      it '空欄でないこと' do
        calendar.start_time = ''
        expect(calendar).to be_invalid;
      end
    end

    context 'partsカラム' do
      it '空欄でないこと' do
        calendar.parts = ''
        expect(calendar).to be_invalid;
      end
    end

end