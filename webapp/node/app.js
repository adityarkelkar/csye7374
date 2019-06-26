// const http = require('http');
// const os = require('os');
// const redis = require('redis');

// const REDISHOST = process.env.REDISHOST || 'localhost';
// const REDISPORT = process.env.REDISPORT || 6379;
// const REDISPASS = process.env.REDIS_PASSWORD;

// const client = redis.createClient({port: REDISPORT, host: REDISHOST, password: REDISPASS})
// // const client = redis.createClient(REDISPORT, REDISHOST, REDISPASS);
// client.on('error', (err) => console.error('ERR:REDIS:', err));
// console.log("Server started....")
// // create a server
// http.createServer((req, res) => {
//   // increment the visit counter
//   client.incr(os.hostname(), (err, reply) => {
//     console.log(reply)
//     if (err) {
//       console.log(err);
//       res.end(err);
//       res.status(500).send(err.message);
//       return;
//     }
    
//     console.log("You have reached csye7374 : " + os.hostname() + "\n");
//     // res.write("PORT NAME : " + os.hostname() + "\n");
//     // res.write("HIT COUNTER : " + reply + "\n");
//     // res.write("Env Variables:\n" + JSON.stringify(process.env));
//     // console.log(process.env)
//   });
// }).listen(process.env.HIT_PORT);



const http = require('http');
const os = require('os');

console.log("Server starting...");

var handler = function(request, response) {
  console.log("Received request from " + request.connection.remoteAddress);
  response.writeHead(200);
  response.end("CSYE 7374: You've hit " + os.hostname() + "in V4\n");
};

var www = http.createServer(handler);
www.listen(process.env.HIT_PORT);
