import Kitura
import LoggerAPI
import HeliumLogger
import myToDoList

HeliumLogger.use()

let mytodolist = myToDoList()

Kitura.addHTTPServer(onPort: 8090, with: mytodolist.router)
Kitura.run()
