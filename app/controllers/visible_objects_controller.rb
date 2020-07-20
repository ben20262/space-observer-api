
class VisibleObjectsController < ApplicationController

    def index
        VisibleObjects.scrape
        objects = VisibleObject.all

        render json: objects
    end

end