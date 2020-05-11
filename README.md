# Screen Share App with nodejs and WebRTC

On a machine with nginx or apache installed run these commands to setup and run the program locally.

```sh
$ cd screenshare
$ chmod +x startup.sh
$ ./startup.sh
$ ln -s ../screenshare /var/www/html
$ node chatserver.js
```

On the browser open `localhost` to run the app.

# Video Streaming with mininet

A nodejs app that streams a video stored at a server to the requesting client on the mininet topology. The client of this app has been stripped down to run on mininet i.e it dosent have an interface, and streams a static file rather than user's camera.

# Installation

To run this program on mininet follow these steps:
```sh
$ git clone
$ cd mininet-stream
$ npm install
// Run mininet
$ sudo mn

// Run the client
$ node server.js
```
Start xterm for client and host inside mininet shell
```sh
mininet> xterm h1 h2
```
Run server on "Node: h1"
```sh
// Run the server
> node server.js
```
Run client on "Node: h2"
```sh
// Run the client
> node client.js
```
If the client is unable to connect to the server inside mininet. Check server's in "Node: h1" IP using `ifconfig` and make sure it matches the one on line 20 in client.js

# Network Simulations

To run network simulations use simulnet.sh. Grant it access by

```sh
$ chmod +x ./simulnet.sh
```

Print the available options by calling the script with no arguements

```sh
$ ./simulnet.sh

 Options:
  [Network Bridge]: ID of the network bridge to run the tests on.
  [mode]: Possible values
          - delay
          - packet_loss
          - bandwidth
          - reset

```

Example: to simulate network delay

```sh
./simulnet.sh enp0s8 delay
```
`enp0s8` is the name of the network adapter on which you want to add delay
