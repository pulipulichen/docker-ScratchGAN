/* global __dirname */

// Copy data from example
const path = require('path')
const fs = require('fs')

if (fs.existsSync(path.resolve(__dirname, './input/train.json')) === false) {
  fs.copyFileSync(path.resolve(__dirname, './input.example/train.json'), path.resolve(__dirname, './input/train.json'))
  fs.copyFileSync(path.resolve(__dirname, './input.example/valid.json'), path.resolve(__dirname, './input/valid.json'))
  fs.copyFileSync(path.resolve(__dirname, './input.example/test.json'), path.resolve(__dirname, './input/test.json'))
  fs.copyFileSync(path.resolve(__dirname, './input.example/glove_emnlp2017.txt'), path.resolve(__dirname, './input/glove_emnlp2017.txt'))
}

// -----------------------

const os = require('os')

if (!os.platform('win32')) {
  const userInfo = os.userInfo();
  
  // user: ${MY_UID}:${MY_GID}
  process.env.MY_UID = userInfo.uid
  process.env.MY_GID = userInfo.gid
}

// -----------------------


const { spawn } = require("child_process");

const cmd = spawn("docker-compose", ["up"]);

cmd.stdout.on("data", data => {
    console.log(`stdout: ${data}`);
});

cmd.stderr.on("data", data => {
    console.log(`stderr: ${data}`);
});

cmd.on('error', (error) => {
    console.log(`error: ${error.message}`);
});

cmd.on("close", code => {
    console.log(`child process exited with code ${code}`);
});