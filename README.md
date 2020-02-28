# Stocks WebSocket Demo Server

Stocks WebSocket Demo Server is a Node.js server that serves example stocks data. The stocks data is fake and should not be used for any real projects.

## API

To connect to the server open a WebSocket connection to `wss://stocks.websocket.demo.cleora.app`.

After a successful handshake the server will respond with a connected message.

```json
{
  "event" : "connected",
  "message" : "All stocks data is not real and is generated solely for demo purposes.",
  "supportedSymbols" : ["IET", "N", "ZHT", "V", "ELY", "TZW", "FIK", "T", "ZQ", "NP", "MJ", "KG", "OY", "ITN", "OB", "ACM", "QQ", "X", "XLC", "S"]
}
```

### Subscribe to updates

To subscribe to stocks data updates send a JSON message with the following format.

```json
{
  "event": "subscribe",
  "stocks": ["IET", "ZHT"]
}
```

Make sure you only include the supported stock symbols in the `stocks` array.

Supported stock sumbols: `["IET", "N", "ZHT", "V", "ELY", "TZW", "FIK", "T", "ZQ", "NP", "MJ", "KG", "OY", "ITN", "OB", "ACM", "QQ", "X", "XLC", "S"]`


### Unsubscribe from updates

To unsubscribe from stocks data updates send a JSON message with the following format.

```json
{
  "event": "unsubscribe",
  "stocks": ["IET", "ZHT"]
}
```

### Error messages

If your message has a wrong format or you try to subscribe to an unsupported stock symbol, the server will respond with a error message that includes a reason for the error.

```json
{
  "event": "error",
  "reason": "invalid message"
}
```

### Connection Status

The server will send ping frames every 15 seconds. If the client doesn't respond with a pong frame or if the client doesn't send any new messages within the following 15 seconds the server will close a connection.


The maximum time for any one connection to stay open is 5 minutes. After 5 minutes the server will close the connection.

Before closing the connection, the server will send a disconnecting message that includes a reason for disconnecting.

```json
{
  "event": "disconnecting",
  "reason": "connection inactive"
}
```

This project is using [ws library](https://github.com/websockets/ws) for WebSocket server. The example stocks data was generated using [fake-stock-market-generator](https://www.npmjs.com/package/fake-stock-market-generator).
