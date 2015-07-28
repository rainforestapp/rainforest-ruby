module Rainforest
  class UsersEndpoint < ApiEndpoint

    def new(id)
      User.new({:id => id}, nil, @client)
    end

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/users", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:User, json, method)
    end

    def retrieve(user_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :user_id => user_id,
      }, params)
      method = ApiMethod.new(:get, "/users/:user_id", params, headers, @parent)
      json = @client.execute(method)
      User.new(json, method)
    end

    def update(user_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :user_id => user_id,
      }, params)
      method = ApiMethod.new(:put, "/users/:user_id", params, headers, @parent)
      json = @client.execute(method)
      User.new(json, method)
    end

    def create(params={}, headers={})
      method = ApiMethod.new(:post, "/users", params, headers, @parent)
      json = @client.execute(method)
      User.new(json, method)
    end

    def reset_password(email, params={}, headers={})
      params = ParamsBuilder.merge({
        :email => email,
      }, params)
      method = ApiMethod.new(:post, "/users/reset_password", params, headers, @parent)
      json = @client.execute(method)
      json
    end

  end
end
