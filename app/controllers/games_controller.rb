class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ("A".."Z").to_a.sample
    end
    @letters
  end

  def score
    # check if letter used in the world belongs to @letters
      # mettre toutes les lettres de params[:word] dans un tableau
      @mot = params[:word]
      @letters = params[:letters]
      word_letter = @mot.split(//)
      # itérer with index sur le tableau word
      word_letter.each_with_index do |letter, id|
        if @letters.include? letter
        # si include dans @letters, alors return supprimer l'élément à l'index, sinon retourner false
          @letters.delete
        else
          return "Sorry, but you can't build #{@mot} out of #{@letter.join}" if result = false
        end
      end
    # check if the word propose existe in the API
      require 'rest-client'
      require 'json'
      url = "https://wagon-dictionary.herokuapp.com/#{@mot}"
      response = RestClient.get(url)
      result = JSON.parse(response)
      if result[:found]
        return 'gg'
      else
        return 'it does not exit'
      end
    end
  end
end
