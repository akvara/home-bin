var process = require('process');

var stdin_input = "";
var args = process.argv.slice(2);

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
    var initial = stdin_input
        .split('\n')
        .filter(function (t) { return t.length>0});

    var tags = initial
        .filter(function (t) { return t[0]==='v'})
        .map(function (t) { return t.substr(1)})
        .map(tillTheSeparator('-'));

    console.log('All tags:', initial);

    let tagBefore;
    let lastMax;
    let start = '';

    for (let i = 0; i < LEVELS; i++) {
        lastMax = Math.max.apply(Math, tags.map(stripStart(start)).filter(Boolean).map(tillTheSeparator('.')).map(toNumber));
        tagBefore = start;
        start = start + lastMax + '.';
    }

    let suggested =  tagBefore + (lastMax + 1);

    console.log('Suggested new tag:', suggested);
    console.log('command: \n');
    console.log(args + '/tag-version.sh ', suggested);
    console.log('\n');
}

function tillTheSeparator (separator) {
    return function (str) {
        var pos = str.indexOf(separator);
        if (pos === -1) {
            return str;
        }
    return str.substr(0, pos);
}}

function stripStart (start) {
    return function (str) {
        return str.startsWith(start) ? str.substr(start.length) : null;
    }
}

function toNumber (str) {
    return parseInt(str,10)
}
