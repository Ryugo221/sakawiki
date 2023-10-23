class TeamsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
      if params[:search] == nil
        @teams= Team.all
      elsif params[:search] == ''
        @teams= Team.all
      else
        #部分検索
        @teams = Team.where("teamname LIKE ? ",'%' + params[:search] + '%')
      end
    end

    def new
      @team = Team.new
    end

    def play
      @player = Player.new
    end
  
    def create
      team = Team.new(team_params)
      team.user_id = current_user.id
      if team.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end

    def show
      @team = Team.find(params[:id])
      @players = @team.players
      @player = Player.new
    end

    def edit
      @team = Team.find(params[:id])
    end
  
    def update
      team = Team.find(params[:id])
      if team.update(team_params)
        redirect_to :action => "show", :id => team.id
      else
        redirect_to :action => "new"
      end
    end
  
    def destroy
      team = Team.find(params[:id])
      team.destroy
      redirect_to action: :index
    end
  
    private
    def team_params
      params.require(:team).permit(:teamname, :image, :explanation, :country)
    end
  
  end