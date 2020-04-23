Inatra.routes do
  get '/hello' do
    [200, {}, ['Hello World']]
  end

  post '/tasks' do
    [201, {}, ['Task created']]
  end

  get '/tasks' do
    [200, {}, ['Task list']]
  end
end
