class Admin::HomesController < ApplicationController

def index
    @customer=Customer.all
end

end
