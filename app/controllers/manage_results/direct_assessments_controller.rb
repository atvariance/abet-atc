class ManageResults::DirectAssessmentsController < ApplicationController
  def show
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)
  end

  def edit
    @assessment = DirectAssessment.find(params[:id])
    authorize(@assessment)
  end
end
