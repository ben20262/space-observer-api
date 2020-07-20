
class VisibleObjectsController < ApplicationController

    def index
        VisibleObject.scrape
        objects = VisibleObject.all

        render json: objects
    end

end