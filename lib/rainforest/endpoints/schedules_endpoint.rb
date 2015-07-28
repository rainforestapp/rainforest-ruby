module Rainforest
  class SchedulesEndpoint < ApiEndpoint

    def new(id)
      Schedule.new({:id => id}, nil, @client)
    end

    def all(params={}, headers={})
      method = ApiMethod.new(:get, "/schedules", params, headers, @parent)
      json = @client.execute(method)
      ApiList.new(:Schedule, json, method)
    end

    def retrieve(schedule_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :schedule_id => schedule_id,
      }, params)
      method = ApiMethod.new(:get, "/schedules/:schedule_id", params, headers, @parent)
      json = @client.execute(method)
      Schedule.new(json, method)
    end

    def delete(schedule_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :schedule_id => schedule_id,
      }, params)
      method = ApiMethod.new(:delete, "/schedules/:schedule_id", params, headers, @parent)
      json = @client.execute(method)
      Schedule.new(json, method)
    end

    def update(schedule_id, params={}, headers={})
      params = ParamsBuilder.merge({
        :schedule_id => schedule_id,
      }, params)
      method = ApiMethod.new(:put, "/schedules/:schedule_id", params, headers, @parent)
      json = @client.execute(method)
      Schedule.new(json, method)
    end

    def create(params={}, headers={})
      method = ApiMethod.new(:post, "/schedules", params, headers, @parent)
      json = @client.execute(method)
      Schedule.new(json, method)
    end

  end
end
