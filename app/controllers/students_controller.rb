class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end


  def new
    @student = Student.new
    @student.grades.build
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to root_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def student_params
    params.require(:student).permit(:name, :age, :phone_number, grades_attributes: [:subject, :score, :semester, :comments])
  end

end
