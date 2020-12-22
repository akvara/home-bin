const process = require('process');

let stdin_input = "";

process.stdin.resume();
process.stdin.setEncoding("utf-8");
process.stdin.on("data", function (input) {
    stdin_input += input;
});
process.stdin.on("end", function () {
    main(stdin_input);
});

function main(stdin_input) {
    const initial = 'ft/'
        + (stdin_input.replace(/\n/g, ' ')
            .replace(/[:\->,+]/g, '')
            .replace('/', '_')
            .split(' ')
            .filter(ss => !['[FE]','[BE]'].includes(ss))
            .filter(Boolean)
            .join('-'));
    // process.stdout.write()
    console.log('command: \n');
    console.log('git co -b ', initial);
    console.log('\n');
}
