//Tem que tipar as varíaveis do express
import { Request, Response } from 'express'

export default {
    async index(req: Request, res: Response) {
        return res.json("Maratona Full Cycle 2.0")
    }
}