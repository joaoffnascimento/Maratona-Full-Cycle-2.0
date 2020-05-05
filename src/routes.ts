import { Router } from 'express'
import IndexController from './controller/IndexController'

const routes = Router()

routes.get('/', IndexController.index)

export default routes