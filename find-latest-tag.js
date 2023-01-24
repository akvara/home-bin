const process = require("process");

let stdin_input = "";
const args = process.argv.slice(2);

process.stdin.resume();
process.stdin.setEncoding("utf-8");
process.stdin.on("data", function (input) {
  stdin_input += input;
});
process.stdin.on("end", function () {
  main(stdin_input);
});

const LEVELS = 3;

function main(stdin_input) {
  const initial = stdin_input.split("\n").filter(function (t) {
    return t.length > 0;
  });

  const tags = initial
    .map(function (t) {
      return t.substr(0);
    })
    .map(tillTheSeparator("-"));

  console.log("All tags:", initial);

  let tagBefore;
  let lastMax;
  let start = "";

  for (let i = 0; i < LEVELS; i++) {
    const arr = tags
      .map(stripStart(start))
      .filter(Boolean)
      .map(tillTheSeparator("."))
      .map(toNumber);
    lastMax = Math.max(...arr, 0);
    tagBefore = start;
    start = start + lastMax + ".";
  }

  const suggested = tagBefore + (lastMax + 1);

  console.log("Suggested new tag:", suggested);
  console.log("command: \n");
  console.log(args + "/git-tag-master.sh ", suggested);
  console.log("\n");
}

function tillTheSeparator(separator) {
  return function (str) {
    const pos = str.indexOf(separator);
    if (pos === -1) {
      return str;
    }
    return str.substr(0, pos);
  };
}

function stripStart(start) {
  return function (str) {
    return str.startsWith(start) ? str.substr(start.length) : null;
  };
}

function toNumber(str) {
  return parseInt(str, 10);
}
