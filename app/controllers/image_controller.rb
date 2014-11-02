class ImagesController < ApplicationController
  def serve
    path = "/my/servers/image/path/#{params[:filename]}"

    send_file( path,
               :disposition => 'inline',
               :type => 'image/jpeg',
               :x_sendfile => true )
  end
end