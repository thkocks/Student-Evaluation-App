class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    student = Student.find(params[:student_id])
    @days = student.days
  end

  def show
    student = Student.find(params[:student_id])
    @day = student.days.find(params[:id])
  end

  def new
    student = Student.find(params[:student_id])
    @day = student.days.build
  end

  def create
    student = Student.find(day_params)
    @day = student.days.create(params[:day])
    if @day.save
      redirect_to([@day.student, @day_path])
    else
      render "new"
    end
  end

  def edit
    student = Student.find(params[:student_id])
    @day = student.days.find(params[:id])
  end

  def update
    student = Student.find(params[:student_id])
    @day = student.days.find(params[:id])
    if @Day.update(day_params)
      redirect_to([@day.student, @day_path])
    else
      render :edit
    end
  end

  def destroy
    student = Student.find(params[:student_id])
    @day = student.days.find(params[:id])
    @day.destroy
    redirect_to([@day.student, @days_path])
  end

  private

  def set_day
    student = Student.find(params[:student_id])
    @day = student.days.find(params[:id])
  end

  def day_params
    params
      .require(:day)
      .permit(
        :eval, :date
      )
  end
end
