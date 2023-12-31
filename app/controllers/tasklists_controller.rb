class TasklistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tasklist, only: %i[ show edit update destroy ]

  # GET /tasklists or /tasklists.json
  def index
    @tasklists = current_user.tasklists.order(:deadline)
  end

  # GET /tasklists/1 or /tasklists/1.json
  def show
  end

  # GET /tasklists/new
  def new
    @tasklist = Tasklist.new
  end

  # GET /tasklists/1/edit
  def edit
  end

  # POST /tasklists or /tasklists.json
  def create
    @tasklist = current_user.tasklists.build(tasklist_params)

    respond_to do |format|
      if @tasklist.save
        format.html { redirect_to tasklists_url(@tasklist), notice: "Tasklist was successfully created." }
        format.json { render :show, status: :created, location: @tasklist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tasklist.errors, status: :unprocessable_entity }
      end
    end 
  end

  # PATCH/PUT /tasklists/1 or /tasklists/1.json
  def update
    respond_to do |format|
      if @tasklist.update(tasklist_params)
        format.html { redirect_to tasklists_url, notice: "Tasklist was successfully updated." }
        format.json { render :index, status: :ok, location: @tasklist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tasklist.errors, status: :unprocessable_entity }
      end
    end

  end


  # DELETE /tasklists/1 or /tasklists/1.json
  def destroy
    @tasklist.destroy!

    respond_to do |format|
      format.html { redirect_to tasklists_url, notice: "Tasklist was successfully destroyed." }
      format.json { head :no_content }
    end
    
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasklist
      @tasklist = current_user.tasklists.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tasklist_params
      params.require(:tasklist).permit(:title, :description, :deadline, :done)
    end
end
