class SmallTelescopeObjectsController < ApplicationController

    def index
        SmallTelescopeObject.scrape
        objects = SmallTelescopeObject.all

        render json: objects
    end

    def show
        
    end

end
