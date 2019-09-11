local types = require "kong.plugins.zipkin-kafka.types"
local typedefs = require "kong.db.schema.typedefs"
local utils = require "kong.tools.utils"

--- Validates value of `bootstrap_servers` field.
local function check_bootstrap_servers(values)
  if values and 0 < #values then
    for _, value in ipairs(values) do
      local server = types.bootstrap_server(value)
      if not server then
        return false, "invalid bootstrap server value: " .. value
      end
    end
    return true
  end
  return false, "bootstrap_servers is required"
end

return {
	name = "zipkin-kafka",
	fields = {
	  { run_on = typedefs.run_on { default = "all" } },
	  { config = {
              type = "record",
	      fields = {
		{ bootstrap_servers = { type = "array", required = true, elements = typedefs.define } },
                { topic = { type = "string", default = "zipkin", required = true } },
                { timeout = { type = "number", default = 10000 } },
                { keepalive = { type = "number", default = 60000 } },
                { producer_request_acks = { type = "number", default = 1, one_of = { -1, 0, 1 } } },
                { producer_request_timeout = { type = "number", default = 2000 } },
                { producer_request_limits_messages_per_request = { type = "number", default = 200 } },
                { producer_request_limits_bytes_per_request = { type = "number", default = 1048576 } },
                { producer_request_retries_max_attempts = { type = "number", default = 10 } },
                { producer_request_retries_backoff_timeout = { type = "number", default = 100 } },
                { producer_async = { type = "boolean", default = true } },
                { producer_async_flush_timeout = { type = "number", default = 1000 } },
                { producer_async_buffering_limits_messages_in_memory = { type = "number", default = 50000 } },
               ---  { uuid = { type = "string", default = utils.uuid() } },
		{ sample_ratio = { type = "number",default = 1,between = { 0, 1 } } },
                { default_service_name = { type = "string", default = nil } },
		{ include_credential = { type = "boolean", required = true, default = true } },
              },
	  }, },
	},
}
