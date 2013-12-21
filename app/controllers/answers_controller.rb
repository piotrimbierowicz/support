class AnswersController < ApplicationController

  def create
    @answer = Answer.new(params[:answer])
    @answer.author = current_user
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      @question = @answer.question
      @project = @question.project
      render 'questions/show'
    end
  end

end