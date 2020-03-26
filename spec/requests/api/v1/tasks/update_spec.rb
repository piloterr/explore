describe 'PUT api/v1/tasks/:id', type: :request do
  let(:user) { create(:user) }
  let!(:task) { create(:task, id: 1, user: user) }

  let(:api_v1_task_path) { '/api/v1/tasks/1' }

  context 'with valid params' do
    let(:params) { { task: { title: 'MyTask', user_id: user.id } } }

    it 'returns success' do
      put api_v1_task_path, params: params, headers: auth_headers, as: :json
      expect(response).to have_http_status(:success)
    end

    it 'updates the task' do
      put api_v1_task_path, params: params, headers: auth_headers, as: :json
      expect(task.reload.title).to eq(params[:task][:title])
    end

    it 'returns the task' do
      put api_v1_task_path, params: params, headers: auth_headers, as: :json

      expect(json[:data][:id]).to eq task.id
      expect(json[:data][:title]).to eq task.title
    end
  end

  context 'with invalid data' do
    let(:params) { { task: { title: '' } } }

    it 'does not update the task' do
      put api_v1_task_path, params: params, headers: auth_headers, as: :json
      expect(task.reload.title).to_not eq(params[:title])
    end
  end
end
