class ResultsController < ApplicationController
  def new
    @assessment = find_assessment
    @result = @assessment.results.build
    authorize(@result)
  end

  def create
    @assessment = find_assessment
    @result = @assessment.results.build(result_params)
    authorize(@result)

    if @result.save
      redirect_to url_for(@assessment)
    else
      render :new
    end
  end

  private

  def result_params
    params.require(:result).permit(
      :assessment_description,
      :assessment_name,
      :percentage,
      :problem_description,
      :semester,
      :year
    )
  end

  def find_assessment
    if params[:direct_assessment_id]
      @assessment = DirectAssessment.find(params[:direct_assessment_id])
    else
      @assessment = IndirectAssessment.find(params[:indirect_assessment_id])
    end
  end
end
