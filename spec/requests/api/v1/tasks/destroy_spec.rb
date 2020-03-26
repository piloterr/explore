describe 'DELETE api/v1/tasks/:id', type: :request do
  let(:user) { create(:user) }
  let!(:task) { create(:task, user: user) }

  let(:api_v1_task_path) { '/api/v1/tasks/:id' }

  context 'with a valid token' do
    it 'returns a successful response' do
      expect {
        delete api_v1_task_path, headers: auth_headers, as: :json
      }.to change(Task, :count).by(0)
    end
  end

  context 'without a valid token' do
    it 'returns not found response' do
      delete api_v1_task_path, headers: {}, as: :json
      expect(response).to have_http_status(401)
    end
  end
end
