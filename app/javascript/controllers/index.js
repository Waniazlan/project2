// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import RoomController from "./room_controller"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

const application = Application.start()
application.register("room", RoomController)