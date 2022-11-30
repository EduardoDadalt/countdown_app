import { Countdown } from "@prisma/client";
import { Request, Response } from "express";
import { z } from "zod";
import database from "../lib/database";

class CategoryController {
  public static getCategories = async (req: Request, res: Response) => {
    const categories = await database.category.findMany({
      where: { isPublic: true },
    });

    return res.status(200).json(categories);
  };

  public static createCategory = async (req: Request, res: Response) => {
    try {
      const { name } = req.body;
      z.string().min(3).max(254).parse(name);
      const category = await database.category.create({
        data: {
          name,
        },
      });

      return res.status(201).json(category);
    } catch (error) {
      return res.status(500).json("Error creating category");
    }
  };

  public static getCountdownByCategory = async (
    req: Request,
    res: Response
  ) => {
    try {
      const {
        params: { id },
        query: { p, size },
      } = z
        .object({
          params: z.object({
            id: z
              .string({ required_error: "The id of category is required" })
              .cuid("The id is not a valid cuid"),
          }),
          query: z.object({
            p: z.preprocess(
              (value) => parseInt(z.string().default("1").parse(value)),
              z.number().int().min(1)
            ),
            size: z.preprocess(
              (value) => parseInt(z.string().default("24").parse(value)),
              z
                .number()
                .int()
                .gte(1, "The size of page must be greater than 0")
                .max(48, "The max number of countdowns is 48")
            ),
          }),
        })
        .parse(req);
      const countdowns: Countdown[] = await database.category
        .findUniqueOrThrow({
          where: {
            id,
          },
          select: {
            Countdowns: {
              take: size,
              skip: (p - 1) * size,
              where: { isPublic: true },
            },
          },
        })
        .then((category) => {
          return category?.Countdowns ?? [];
        });

      return res.status(200).json(countdowns);
    } catch (error) {
      console.error(error);
      if (error instanceof z.ZodError)
        return res.status(400).send(error.issues);

      return res.status(500).send("Error while getting countdowns by category");
    }
  };
}

export default CategoryController;
