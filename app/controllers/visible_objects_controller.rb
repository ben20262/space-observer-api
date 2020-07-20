
class VisibleObjectsController < ApplicationController

    def index
        objects = VisibleObject.all

        render json: objects
    end

end