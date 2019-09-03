package = "kong-plugin-zipkin-kafka"
version = "0.0.1-0"
source = {
   url = "git://github.com/HefeiJoe/kong-plugin-zipkin-kafka",
   tag = "0.0.1"
}
description = {
   summary = "",
   homepage = "https://github.com/HefeiJoe/kong-plugin-zipkin-kafka.git",
   license = "Apache 2.0"
}
dependencies = {
   "lua >= 5.1",
   "lua-resty-kafka >= 0.06"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.zipkin-kafka.handler"] = "kong/plugins/zipkin-kafka/handler.lua",
      ["kong.plugins.zipkin-kafka.schema"] = "kong/plugins/zipkin-kafka/schema.lua",
      ["kong.plugins.zipkin-kafka.codec"] = "kong/plugins/zipkin-kafka/codec.lua",
      ["kong.plugins.zipkin-kafka.opentracing"] = "kong/plugins/zipkin-kafka/opentracing.lua",
      ["kong.plugins.zipkin-kafka.random_sampler"] = "kong/plugins/zipkin-kafka/random_sampler.lua",
      ["kong.plugins.zipkin-kafka.reporter"] = "kong/plugins/zipkin-kafka/reporter.lua",

      ["kong.plugins.zipkin-kafka.types"] = "kong/plugins/zipkin-kafka/types.lua",
      ["kong.plugins.zipkin-kafka.producers"] = "kong/plugins/zipkin-kafka/producers.lua",
   }
}
