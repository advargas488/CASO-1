import {JDBC, ResultSet, Statement} from '@naxmefy/jdbc'
const myDatabase = new JDBC({
  className: 'any.jdbc.Driver',
  url: 'jdbc:sqlserver://ADRIAN\SERVIDORSQL;databaseName=Caso_1;',
  username: 'sa',
  password: 'sa'
})

myDatabase.createStatement()
  .then((statement: Statement) => {
    return statement.executeQuery('SELECT * FROM FOO')
  })
  .then((resultSet: ResultSet) => {
      const arrayOfResults = resultSet.fetchAllResults()
      arrayOfResults.forEach((result: any) => {
          console.log(result)
      })
  })