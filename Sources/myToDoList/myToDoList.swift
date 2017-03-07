import Kitura
import LoggerAPI
import SwiftyJSON
import Dispatch

public class myToDoList {
  public let router = Router()
  var tasks: [String] = []
  let queue = DispatchQueue(label: "com.expample.mytodo")
  public init() {
    router.all("*", middleware: BodyParser())
    router.get("/v1/tasks", handler: handleGetTasks)
    router.post("/v1/tasks", handler: handleAddTask)
    tasks.append("牛乳を買う")
  }
}

extension myToDoList {
  func handleGetTasks(request: RouterRequest,
                      response: RouterResponse,
                      next: @escaping() -> Void) throws
  {
  Log.info("Show my tasks!")
    response.status(.OK).send(json: JSON(tasks))
  next()
  }

func handleAddTask(request: RouterRequest,
                    response: RouterResponse,
                    next: @escaping() -> Void) throws
  {
    guard let json = request.json else {
      response.status(.badRequest)
      next()
      return
    }
    let description = json["description"].stringValue
    queue.sync {
      tasks.append(description)
      Log.info("Adding a task!")
      response.status(.OK).send("Added a task!")
      next()
    }
  }
}


