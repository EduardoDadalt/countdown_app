import { Request, Response } from "express";
import { z } from "zod";
import { CountdownModel } from "../../prisma/zod";
import database from "../lib/database";

class CountdownController {
  public static createCountdownSchema = z.object({
    body: CountdownModel.pick({
      date: true,
      title: true,
      categoryId: true,
    }).merge(
      z.object({
        date: z.preprocess(
          (value) => new Date(z.string().parse(value)),
          z.date()
        ),
      })
    ),
  });

  public static createCountdown = async (req: Request, res: Response) => {
    try {
      const {
        body: { date, title, categoryId },
      } = this.createCountdownSchema.parse(req);

      const countdown = await database.countdown.create({
        data: {
          date,
          title,
          categoryId,
        },
      });

      return res.status(201).json(countdown);
    } catch (error) {
      return res.status(500).json("Error creating countdown");
    }
  };
}

export default CountdownController;
