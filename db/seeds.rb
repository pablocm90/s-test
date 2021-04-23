require 'json'
require 'open-uri'

# We get the data from https://opentdb.com/api_config.php

# Define an array of quizzes
urls = ['https://opentdb.com/api.php?amount=3&category=10&difficulty=easy&type=multiple',
        'https://opentdb.com/api.php?amount=3&category=22&difficulty=medium&type=multiple',
        'https://opentdb.com/api.php?amount=3&category=26&difficulty=easy&type=multiple',
        'https://opentdb.com/api.php?amount=3&category=23&difficulty=hard&type=multiple',
        'https://opentdb.com/api.php?amount=3&category=11&difficulty=medium&type=multiple',
        'https://opentdb.com/api.php?amount=3&category=25&difficulty=hard&type=multiple',
        'https://opentdb.com/api.php?amount=3&category=9&difficulty=easy&type=multiple',
        'https://opentdb.com/api.php?amount=3&category=21&difficulty=medium&type=multiple',
        'https://opentdb.com/api.php?amount=3&category=24&difficulty=easy&type=multiple']

puts '1. Cleaning database...'

Answer.destroy_all
Question.destroy_all
Quiz.destroy_all

puts '2. Creating quizzes, questions, answers...'

# Iterate through the URLs to get the data
urls.each do |url|
  url_serialized = open(url).read
  quiz = JSON.parse(url_serialized)
  last_quiz = Quiz.create!(title: quiz["results"].first["category"],
                           difficulty: quiz["results"].first["difficulty"])

  # Iterate through each quiz to get the questions and the answers
  quiz["results"].each do |result|
    last_question = Question.create!(content: result["question"],
                                     quiz_id: last_quiz.id)

    # Store the right answer
    Answer.create!(content: result["correct_answer"],
                   right: true,
                   question_id: last_question.id)

    # Iterate through the wrong answers and store it
    result["incorrect_answers"].each do |answer|
      Answer.create!(content: answer,
                     right: false,
                     question_id: last_question.id)
    end
  end
end

puts 'Finished!'
