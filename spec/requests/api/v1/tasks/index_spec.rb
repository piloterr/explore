describe 'GET api/v1/task', type: :request do
  let(:user) { create(:user) }
  let!(:task) { create(:task, id: 1, user: user) }

  let(:api_v1_task_path) { '/api/v1/tasks' }

  it 'returns success' do
    get api_v1_task_path, headers: auth_headers, as: :json
    expect(response).to have_http_status(:success)
  end
end
