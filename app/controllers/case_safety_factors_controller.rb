class CaseSafetyFactorsController < ApplicationController
  before_action :set_case, only: [:new, :create, :edit, :update]

  def index
    @case_safety_factors = CaseSafetyFactor.where(case: @case)
    authorize @case_safety_factors
  end

  def new
    @case_safety_factor = Case_safety_factor.new
  end

  def create
    @case_safety_factor = Case_safety_factor.new(case_safety_factor_params)
    @case_safety_factor.case = @case
    if @case_safety_factor.save
      redirect_to case_safety_factor_path(@case_safety_factor)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @case_safety_factor.update(case_safety_factor_params)
      redirect_to case_safety_factor_path(@case_safety_factor_factor)
    else
      render :edit
    end
  end

  def destroy
    @case_safety_factor.destroy
    redirect_to case_path(@case)
  end

  private

  def set_case_safety_factor
    @case_safety_factor = Case_safety_factor.find(params[:id])
  end

  def set_case
    @case = Case.find(params[:case_id])
  end

  def case_safety_factor_params
    params.require(:case_safety_factor).permit(:reason, :safety_factor_id)
  end
end
