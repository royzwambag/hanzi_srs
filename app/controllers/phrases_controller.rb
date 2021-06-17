class PhrasesController < ApplicationController
  def index
    @phrases = Phrase.all
  end

  def new
    @phrase = Phrase.new
  end

  def show
    @phrase = Phrase.find(params[:id])
  end

  def create
    @phrase = Phrase.new(phrase_params)

    if @phrase.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @phrase = Phrase.find(params[:id])
  end

  def update
    @phrase = Phrase.find(params[:id])

    if @phrase.update(phrase_params)
      redirect_to @phrase
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @phrase = Phrase.find(params[:id])
    @phrase.destroy

    redirect_to action: :index
  end

  private

  def phrase_params
    params.require(:phrase).permit(:value, :pinyin, :english_translation)
  end
end
