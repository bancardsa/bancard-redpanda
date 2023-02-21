require "kafka"
require "json"

class RedpandaKafka
  def self.hi(initial_date_time, end_date_time, financial_institution_code, 
    financial_institution_name, entity_tid, tid, ticket_number, status, http_response,
    error_description, ws_url, service, product_id, product_name, type, consumed_time,
    server, request, response, additional_data)
    puts "Hello world!"

    p 'inicia envio la gema'
    config = Kafka::Config.new("bootstrap.servers": "staging.redpanda:9092")
    producer = Kafka::Producer.new(config)

    message = {
      "initial_date_time": initial_date_time,
      "end_date_time": end_date_time,
      "financial_institution_code": financial_institution_code,
      "financial_institution_name": financial_institution_name,
      "entity_tid": entity_tid,
      "tid": tid,
      "ticket_number": ticket_number,
      "status": status,
      "http_response": http_response,
      "error_description": error_description,
      "ws_url": ws_url,
      "service": service,
      "product_id": product_id,
      "product_name": product_name,
      "type": type,
      "consumed_time": consumed_time,
      "server": server,
      "request": request,
      "response": response,
      "additional_data": additional_data
    }

    # Asynchronously publish a JSON payload to the events topic.
    # event = { time: Time.now, status: "success3" }
    result = producer.produce("demo", message.to_json)

    # Wait for the delivery to confirm that publishing was successful.
    result.wait
    result.successful?
    p 'fin envio la gema'
  end
end
