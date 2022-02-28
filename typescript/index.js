"use strict";
exports.__esModule = true;
var jdbc_1 = require("@naxmefy/jdbc");
var myDatabase = new jdbc_1.JDBC({
    className: 'any.jdbc.Driver',
    url: 'jdbc:sqlserver://ADRIAN\SERVIDORSQL;databaseName=Caso_1;',
    username: 'sa',
    password: 'sa'
});
myDatabase.createStatement()
    .then(function (statement) {
    return statement.executeQuery('SELECT * FROM FOO');
})
    .then(function (resultSet) {
    var arrayOfResults = resultSet.fetchAllResults();
    arrayOfResults.forEach(function (result) {
        console.log(result);
    });
});
