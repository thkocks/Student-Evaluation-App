class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @evaluations = @student.evaluations
  end

  def new
    @batch = Batch.find(params[:batch_id])
    @student = @batch.students.new
  end

  def create
    @batch = Batch.find(params[:batch_id])
    @student = @batch.students.new(student_params)

    if @student.save
      redirect_to batch_student_path(batch_id: @batch, id: @student), notice: "Student created"
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(student_params)
      redirect_to @student, notice: "Student updated"
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy

    redirect_to batch_path(batch_id: @batch), notice: "Student deleted"
  end

  private

  def student_params
    params
      .require(:student)
      .permit(
        :first_name, :last_name, :photo
      )
  end
end
