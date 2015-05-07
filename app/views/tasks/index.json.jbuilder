json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :started_on, :expired_on, :targeted_to, :type, :max, :min, :user_id
  case task
	  when MeetingTask
	    json.extract! task, :location,:latitude, :longitude, :date
   when SocialTask
      json.extract! task, :action
   when SurveyTask
      json.extract! task, :survey_id
  end
  json.url task_url(task, format: :json)
end
