json.array!(@results) do |result|
  json.extract! result, :id, :task_id, :user_id, :started_date, :ended_date, :comment, :task_id, :user_id
  json.url result_url(result, format: :json)
end
