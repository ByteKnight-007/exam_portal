require 'rails_helper'

RSpec.describe ExamController, type: :controller do
  describe 'POST #onboard_candidate' do
    let(:valid_params) do
      {
        first_name: 'Harshit',
        last_name: 'Kumar',
        phone_number: '9366459010',
        college_id: '1',
        exam_id: '1',
        start_time: Time.zone.now
      }
    end

    context 'with incomplete or invalid parameters' do
      it 'responds with 400 and error message' do
        invalid_params = valid_params.except(:first_name)
        post :onboard_candidate, params: invalid_params
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)).to include('error' => 'Invalid or incomplete parameters')
      end
    end
  end
end
