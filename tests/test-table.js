var Table = require('cli-table');
var table = new Table({ head: ["", "Date/time", "Origin", "Event message"] });

table.push(
    { 'Notice': ['10283844', 'Core: Models', 'This is a string formatted by its emitter based upon some execution context/event'] }
  , { 'Warning': ['98357535', 'Plugin: Jade', 'Another system message intended to communicate larger bodies of text such as error messages'] }
);

console.log(table.toString());
