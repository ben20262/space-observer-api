class BinocularObjectsController < ApplicationController

    def index
        BinocularObject.scrape
        objects = BinocularObject.all

        render json: objects
    end

    def show
        
    end

end
