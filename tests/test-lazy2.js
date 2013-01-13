var lazy = require('lazy');
var spawn = require('child_process').spawn;
var iptables = spawn('iptables', ['-L', '-n', '-v']);

lazy(iptables.stdout)
    .lines
    .map(String)
    .skip(2) // skips the two lines that are iptables header
    .map(function (line) {
        // packets, bytes, target, pro, opt, in, out, src, dst, opts
        var fields = line.trim().split(/\s+/, 9);
        return {
            parsed : {
                packets : fields[0],
                bytes : fields[1],
                target : fields[2],
                protocol : fields[3],
                opt : fields[4],
                in : fields[5],
                out : fields[6],
                src : fields[7],
                dst : fields[8]
            },
            raw : line.trim()
        };
    });
