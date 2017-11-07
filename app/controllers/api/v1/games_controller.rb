module Api
  module V1
    class GamesController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authenticate_user!

      def index
        @games = current_user.games.order("title ASC, release_date ASC NULLS LAST")
        render json: @games, status: 200
      end

      def show
        @games = current_user.games.find(params[:id])
        render json: @games, status: 200
      end

      def create
        game = current_user.games.new(game_params)
        if game.save
          render json: game, status: 200
        else
          render json: game.errors, status: :unprocessable_entity
        end
      end

      def update
        @game = current_user.games.find(params[:id])
        if @game.update(game_params)
          render json: @game, status: 200
        else
          render json: @game.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @game = current_user.games.find(params[:id])
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
