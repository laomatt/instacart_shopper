class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]

  # GET /applicants
  # GET /applicants.json
  def index
    @applicants = Applicant.all
  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      @applicant.status = 0
      @applicant.save
      redirect_to applicant_path
    else
      flash[:error] = @applicant.full_messages.join(',')
      redirect_to :back
    end
  end
end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    def applicant_params
      params.require(:applicant).permit(:id, :first_name, :last_name, :email, :phone, :zip_code)
    end
  end
