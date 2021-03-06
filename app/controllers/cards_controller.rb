class CardsController < ApplicationController
  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards }
    end
  end

  # GET /cards/new
  # GET /cards/new.json
  def new
    @card = Card.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card }
    end
  end

  # GET /cards/1/edit
  def edit
    @card = Card.find(params[:id])
    @remote = false
    @project_id = @card.project.id
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(params[:card])
    action = @card.project.actions.create! activity: "#{current_user.name} created \"#{@card.story}\" Card"
    respond_to do |format|
      if @card.save
        # format.html { redirect_to @card, notice: 'Card was successfully created.' }
        # format.json { render json: @card, status: :created, location: @card }
        format.js
      else
        # format.html { render action: "new" }
        # format.json { render json: @card.errors, status: :unprocessable_entity }
        action.delete
        format.js
      end
    end
  end

  # PUT /cards/1
  # PUT /cards/1.json
  def update
    @card = Card.find(params[:id])
    @card.project.actions.create! activity: "#{current_user.name} chanded \"#{@card.story}\" to #{params[:card][:story]} Card story"
    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to project_url(@card.project), notice: 'Card updated' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card = Card.find(params[:id])
    @card.project.actions.create! activity: "#{current_user.name} destroyed \"#{@card.story}\" Card"
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_url }
      format.json { head :no_content }
      format.js
    end
  end

  def update_status
    @card = Card.find(params[:card])
    old_status = @card.card_status.status
    @card.card_status = CardStatus.find(params[:status])
    @card.save
    @card.project.actions.create! activity: "#{current_user.name} moved \"#{@card.story}\" card story from #{old_status} to #{@card.card_status.status}"
    respond_to do |format|
      format.js
      format.html{ redirect_to request.referer}
    end
  end
end
