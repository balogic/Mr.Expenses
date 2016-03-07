class SalaryController < ApplicationController
  def index
  	@salary = Salary.all
  end

  def new
  end

  def edit
  	@salary = Salary.find(params[:id])
  end

  def create
  	@salary = Salary.new(salary_params)
  	if @salary.save
  		redirect_to @salary
  	else
  		render 'new'
  	end
  end

  def update
  	@salary = Salary.find(params[:id])
  	if @salary.update(salary_params)
  		redirect_to @salary
  	else
  		render 'edit'
  	end
  end

  def show
  	@salary = Salary.find(params[:id])
  end

  def salary_params
  	params.require(:salary).permit(:amount, :purchase)
  end
end
