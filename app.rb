require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @vowels = @analyzed_text.count_of_vowels
    @consonants = @analyzed_text.count_of_consonants
    @most_common_letter = @analyzed_text.most_used_letter
    @num_common_letter = @analyzed_text.most_used_letter
    
    
    erb :results
  end

end
