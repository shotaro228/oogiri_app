namespace :task do
  desc "今日のquestionを設定"
  task today_question: :environment do
    Question.set_today_question
  end
  
end
