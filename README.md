# CocoaRoutes: Minimalist Web Framework
**CocoaRoutes** is a minimalist web framework inspired by Python [Routes](http://routes.readthedocs.org/en/latest/).

### Example

```objc
CRMapper *mapper = [[CRMapper alloc] init];
[mapper connect:@"/greet/:name/:message"
     controller:[CRBlockController get:^NSString *(HTTPMessage *message, NSDictionary *args) {
    return [NSString stringWithFormat:@"Hello %@, %@.", args[@"name"], args[@"message"]];
}]];
CRHTTPServer *server = [[CRHTTPServer alloc] initWithMapper:mapper];
server.port = 8080;
[server start:nil];
```

    $ curl http://localhost:8080/greet/James/Welcome
    Hello James, Welcome.
