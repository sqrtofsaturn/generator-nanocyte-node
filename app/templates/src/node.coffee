class <%= className %>
  constructor: (@config={}, @data={}) ->
  onMessage:(message, callback=->)=>

    # @config stores properties/options of the node
    someProperty = @config.someNodeProperty

    # @data is your node's persistant memory store, if there is already data on it
    # you can call it, otherwise below shows how to assign it values.
    @data.someArray = []
    @data.push 50
    # callback null will finish the process without sending a MESSAGE
    # callback null, YOUR-MESSAGE-OBJECT-TO-SEND
    callback null, message

module.exports = <%= className %>
