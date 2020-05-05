import express from 'express'
import routes from './routes'
import cors from 'cors'

const app = express()

// Configuração do servidor
app.use(cors())
app.use(routes)
app.listen(3000)