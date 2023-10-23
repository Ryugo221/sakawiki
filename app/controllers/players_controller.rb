class PlayersController < ApplicationController
    before_action :authenticate_user!

    def create
      team = Team.find(params[:team_id])
      player = team.players.build(player_params) #buildを使い、contentとteam_idの二つを同時に代入
      player.user_id = current_user.id
      if player.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      end
    end

    def edit
        @player = Player.find(params[:id])
        session[:previous_url] = request.referer
    end

    def update
        player = Player.find(params[:id])
        if player.update(player_params)
          redirect_to session[:previous_url]
        else
          redirect_to :action => "/teams"
        end
    end

    def destroy
        player = Player.find(params[:id])
        player.destroy
        redirect_back(fallback_location: root_path)
      end

    private
  
      def player_params
        params.require(:player).permit(:name, :image, :explanation, :nationality)
      end
end
