class CharactersController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :destroy]

    # home display
    def index
        # if params passed, filter, if not, no filter!
        if params[:series].blank?
            @characters = Character.all.order("created_at DESC")
        else
            @series_id = Series.find_by(name: params[:series]).id
            @characters = Character.where(:series_id => @series_id).order("created_at DESC")
        end
    end

    # display indevidual characters
    def show
    end

    # creates new character
    def new
        # assigns new char to current user
        @character = current_user.characters.build
        # preps series
        @series = Series.all.map{ |s| [s.name, s.id] }
    end
    def create
        # passes in created character
        @character = current_user.characters.build(character_params)
        @character.series_id = params[:series_id] 
        if @character.save
            redirect_to root_path
        else
            render 'new'
        end

    end

    # Update/Edit existing character + autofills fields 
    def edit 
        @series = Series.all.map{ |s| [s.name, s.id] }
        
    end

    def update 
        @character.series_id = params[:series_id] 
        if @character.update(character_params)
            redirect_to character_path(@character)
        else
            render 'edit'
        end

    end

    # Delete
    def destroy 
        @character.destroy
        redirect_to root_path
    end

    private
    # Character params
    def character_params
        params.require(:character).permit(:name, :description, :thoughts, :series_id)
    end

    def find_book
        @character = Character.find(params[:id])
    end


end
