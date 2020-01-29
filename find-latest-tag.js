var process = require('process');

var stdin_input = "";

process.stdin.resume();
process.stdin.setEncoding("utf-8");
process.stdin.on("data", function (input) {
    stdin_input += input;
});
process.stdin.on("end", function () {
    main(stdin_input);
});

function main(stdin_input) {
    var initial = stdin_input
        .split('\n')
        .filter(function (t) { return t.length>0});

    var tags = initial
        .filter(function (t) { return t[0]==='v'})
        .map(function (t) { return t.substr(1)})
        .map(tillTheSeparator('-'));

    console.log('All tags:', initial);

    // console.log('-****- tags', tags);

    // console.log('-****- len', tags.length);
    var first = Math.max.apply(Math, tags.map(tillTheSeparator('.')).map(toNumber));
    // console.log('-****- first', first);
    var second =  Math.max.apply(Math, tags.map(stripStart(first + '.')).filter(Boolean).map(tillTheSeparator('.')).map(toNumber));
    // console.log('-****- second', second);
    var third =  Math.max.apply(Math, tags.map(stripStart(first + '.' + second + '.')).filter(Boolean).map(tillTheSeparator('.')).map(toNumber));
    // console.log('-****- third', third);

    console.log('Suggested new tag: ', first + '.' + second + '.' + (third + 1));
}

function tillTheSeparator (separator) {
    return function (str) {
        var posOfDot = str.indexOf(separator);
        if (posOfDot === -1) {
            return str;
        }
    return str.substr(0, posOfDot);
}}

function stripStart (start) {
    return function (str) {
        var pos = str.indexOf(start);
        if (pos === -1) {
            return null;
        }
        return str.substr(start.length);
    }
}

function toNumber (str) {
    return parseInt(str,10)
}
