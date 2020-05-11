// Dependencies
var fs = require('fs');
var url = require('url');
var http = require('http');
var exec = require('child_process').exec;
var spawn = require('child_process').spawn;

// App variables
var file_url = 'localhost';
var DOWNLOAD_DIR = './downloads/';

// We will be downloading the files to a directory, so make sure it's there
// This step is not required if you have manually created the directory
//var mkdir = 'mkdir -p ' + DOWNLOAD_DIR;
download_file_httpget(file_url);


// Function for downloading file using HTTP.get
function download_file_httpget(file_url) {
  const options = {
    hostname: '10.0.0.1',
    port: 3000,
    path: '/video',
    method: 'GET',

  }

  //var file_name = url.parse(file_url).pathname.split('/').pop();
  var file = fs.createWriteStream(DOWNLOAD_DIR + 'file_name.mp4');
  i = 0;
  http.get(options, function(res) {
    console.log(res.headers);
    res.on('data', function(data) {

      i = i+1
      file.write(data);
    }).on('end', function() {
      file.end();
      console.log(' downloaded to ' + DOWNLOAD_DIR);
    });
  });
};
