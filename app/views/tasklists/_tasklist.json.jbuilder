json.extract! tasklist, :id, :title, :description, :deadline, :user_id, :created_at, :updated_at
json.url tasklist_url(tasklist, format: :json)
