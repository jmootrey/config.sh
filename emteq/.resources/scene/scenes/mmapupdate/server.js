fs = require('fs');
http = require('http');
url = require('url');


http.createServer(function(req, res){
  var request = url.parse(req.url, true);
  var action = request.pathname;

  if (action == '/') {
     var img = fs.readFileSync('/opt/scenes/mmapupdate/world.jpg');
     res.writeHead(200, {'Content-Type': 'image/jpg' });
     res.end(img, 'binary');
  } else { 
     var img = fs.readFileSync('/opt/scenes/mmapupdate/world.jpg');
     res.writeHead(200, {'Content-Type': 'image/jpg' });
     res.end(img, 'binary');

  }
}).listen(80, '10.0.9.1');
