class SportsController < ApplicationController
    def index
    end
  
    def new
      @sport = Sport.new
    end
  
    def show
      @sport = Sport.find_by(id: params[:id])
    end
  
    def create
      @sport = Sport.new(sport_params)
      params[:sport][:question] ? @sport.question = params[:sport][:question].join("") : false
      if @sport.save
          flash[:notice] = "診断が完了しました"
          redirect_to sport_path(@sport.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def sport_params
        params.require(:sport).permit(:id, question: [])
    end
end
