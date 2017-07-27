# socketio-docker

Docker image for socket.io

## Usage

Copy your socket.io server script to `/srv/app.js`

Supervisord logs are stored in `/srv/logs`

### Example

#### app.js

```js
var http = require('http');
var socketio = require('socket.io');

var app = http.createServer(function(req, res) {
    var postData = "";
    req.on('data', function(chunk) {
      postData += chunk; //Get the POST data
    });

    req.on('end', function() {
      if (typeof(postData) !== "undefined") {
        var message = JSON.parse(postData);
        
        //Do something here
        //Todo...
      }
    });
    res.end();
}).listen(8080);  //Use a non-standard port so it doesn't override your Apache

var io = socketio.listen(app); //Attach socket.io to port 8080

io.sockets.on('connection', function(socket) {
  socket.on('disconnect', function () {
    
  });
});

```

### docker run
```ssh
docker run -ti -d --restart=always --name mysocketio -v /path/to/your/main/script/app.js:/srv/app.js -p 8080:8080 voduytuan/docker-socketio
```

### docker exec
```ssh
docker exec -ti mysocketio sh
```
