json.extract! answer, :id, :content, :question_id, :parent_id, :user_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)
