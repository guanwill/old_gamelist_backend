module Api
  module V1
    class GamesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @games = Game.all
        # @games = Game.where(:user_id => current_user.id).order("title ASC, release_date ASC NULLS LAST")
        render json: @games, status: 200
      end

      def show
        @games = Game.find(params[:id])
        render json: @games, status: 200
      end

      def create
        game = Game.new(game_params)
        # game.user_id = current_user.id

        if game.save
          render json: game, status: 200
        else
          render json: game.errors, status: :unprocessable_entity
        end
      end

      def update
        @game = Game.find(params[:id])
        if @game.update(game_params)
          render json: @game, status: 200
        else
          render json: @game.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @game = Game.find(params[:id])
        if @game.destroy
          head :no_content, status: :ok
        else
          render json: @game.errors, status: :unprocessable_entity
        end
      end

      def edit
      end

      def new
      end

      private

      def game_params
        params.required(:game).permit(:title, :genre, :platform, :release_date, :progress, :rating, :review, :comments)
      end

    end

  end
end
