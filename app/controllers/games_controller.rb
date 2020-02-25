class GamesController < ApplicationController

  def create
    @game = policy_scope(Game.find(params[:id]))
  end

  def show
    # case @game.status
    # game.started
    #  when 0
        @game = Game.find(params[:id])


        # create the Chatroom instance
        # edit the channel QR code avec l'URL vers la chatroom :
          # send Get request CURL -i http(s)://api.qrserver.com/v1/create-qr-code/?data=[URL-encoded-text]&size=[pixels]x[pixels]
        #  JAVASCRIPT Fetch QR Code

        # wait for participant to connect in the channel with the QR code
        # broadcast the view#start

        # /////
        # le participant est connecté sur l'app
        # il reçoit le code de la Chatroom
        #


      # else

      # end
    # end
    authorize @game
  end

end
