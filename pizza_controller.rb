require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require ('./models/pizza.rb')


  #NEW -CREATE -get form
    get '/pizzas/new' do #must go above the :id route beacause that route means anything so it will never =make it to 'new'.
      erb(:new)
      
    end 

  #INDEX - READ - find by id
    get '/pizzas' do 
      @pizzas = Pizza.all() #make it an insatance variable @ symbol. 
      erb(:index)
    end 

  #SHOW - READ - all
    get '/pizzas/:id' do#must have the colon to get the params. the word used becomes the params hash key. 
      @pizza = Pizza.find(params[:id])
      erb(:show)
    end
  

  #CREATE - CREATE - post form 
    post'/pizzas' do 
      @pizza = Pizza.new (params)
     @pizza.save
     erb(:create)
      # params[:first_name]
      # params[:last_name]
      # params[:topping]
      # params[:quantity]
      
    end

  # EDIT ROUTE - UPDATE - create form 
  get '/pizzas/:id/edit' do
    @pizza = Pizza.find(params[:id])
    erb(:edit) 
      # post'/pizzas/:id/update' do
      # @pizza = Pizza.find(params[:id])
      # erb(:update) 
    end 
 

  #UPDATE ROUTE - UPDATE - submit form 
  post '/pizzas/:id' do 
    pizza = Pizza.new(params)
    pizza.update
    redirect to ("pizzas/#{pizza.id}")
  end


  #DESTROY - DELETE
    post '/pizzas/:id/delete' do 
      @pizza = Pizza.find(params[:id])
      @pizza.delete
      redirect to ('/pizzas')

    end 

    get '/Home' do
      erb(:home)
    end