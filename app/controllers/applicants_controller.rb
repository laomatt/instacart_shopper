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
    @applicant = Applicant.new(applicant_params)
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit
  end

  def create
    @applicant = Applicant.new(applicant_params)
    # instead of saving it lets imagine that I sent it to some API, and if i get a 200 back i will redirect over
    if @applicant.save
      redirect_to thank_you_applicants_path
    else
      
      redirect_to :back
    end
  end

  # POST /applicants
  # POST /applicants.json
  def create_conf
    session[:email] = applicant_params[:email]
    if session[applicant_params[:email]].nil?
      session[applicant_params[:email]] = {}
    end
    session[applicant_params[:email]][:first_name] = applicant_params[:first_name]
    session[applicant_params[:email]][:last_name] = applicant_params[:last_name]
    session[applicant_params[:email]][:email] = applicant_params[:email]
    session[applicant_params[:email]][:phone] = applicant_params[:phone]
    session[applicant_params[:email]][:zip_code] = applicant_params[:zip_code]
  end


  private
    # Use callbacks to share common setup or constraints between actions.
  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:id, :first_name, :last_name, :email, :phone, :zip_code, :referrer)
  end
end
