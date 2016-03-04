class SalaryController < ApplicationController
  def index
  	@salary = Salary.all
  end

  def new
  end

  def create
  	@salary = Salary.new(salary_params)
  	@salary.save
  	redirect_to @salary
  end

  def show
  	@salary = Salary.find(params[:id])
  end

  def salary_params
  	params.require(:salary).permit(:amount, :purchase)
  end
end
