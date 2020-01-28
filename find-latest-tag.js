var process = require('process');

process.stdin.resume();
process.stdin.setEncoding("utf-8");
var stdin_input = "";

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
        .map(function (t) {
            var posOfDash = t.indexOf('-');
            if (posOfDash === -1) {
                return t
            }
            return t.substr(0, posOfDash);
        });

    console.log('All tags:', initial);

    console.log('-****- tags', tags);

    console.log('-****- len', tags.length);

}
