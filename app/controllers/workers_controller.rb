class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  before_action :set_hospital, only: [:show]

  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.includes(:hospitals).limit(100)
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_hospital
    @worker = Worker.find(params[:worker_id])
    @hospital = Hospital.find(params[:hospital_id])
    arr = []
    arr << @worker.id
    if params[:commit] == "Add"
      @result = @hospital.worker_ids + arr
      unless @worker.hospital_ids.include?(@hospital_id)
        respond_to do |format|
          @hospital.update_attribute(:worker_ids, @result)
          format.html { redirect_to @hospital, notice: 'Worker was successfully added!' }
          format.json { render :show, status: :ok, location: @hospital }
        end
      end
    else
      @result = @hospital.worker_ids - arr
      unless @worker.hospital_ids.include?(@hospital_id)
        respond_to do |format|
          @hospital.update_attribute(:worker_ids, @result)
          format.html { redirect_to @hospital, notice: 'Worker was successfully destroyed.' }
          format.json { render :show, status: :ok, location: @hospital }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def set_hospital
      @hospitals = Hospital.find(@worker.hospital_ids)
      @numbers = []
      @hospitals.each { |h| @numbers << h.number }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:surname, :birth_year, :position, hospital_ids: [])
    end
end
