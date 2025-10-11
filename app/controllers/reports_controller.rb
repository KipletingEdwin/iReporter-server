class ReportsController < ApplicationController
    before_action :authorize_request   # ensures user is logged in via JWT
    before_action :set_report, only: [:show, :update, :destroy]
  
    # GET /reports
    def show
        render json: report_json(@report)
      end
      
      def index
        reports = current_user.reports
        render json: reports.map { |r| report_json(r) }
      end
      
  
    # POST /reports
    def create
      report = current_user.reports.build(report_params)
      report.status = "pending"
  
      if report.save
        render json: report, status: :created
      else
        render json: { errors: report.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PUT /reports/:id
    def update
      if @report.update(report_params)
        render json: @report
      else
        render json: { errors: @report.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /reports/:id
    def destroy
      @report.destroy
      head :no_content
    end
  
    private
  
    def set_report
      @report = current_user.reports.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Report not found" }, status: :not_found
    end

    private

    def report_json(report)
    report.as_json.merge(
        evidence_url: report.evidence.attached? ? url_for(report.evidence) : nil,
        evidence_type: report.evidence.attached? ? report.evidence.content_type : nil
    )
    end

  
    def report_params
        params.permit(:title, :description, :category, :location, :evidence)
      end
      
  end
  