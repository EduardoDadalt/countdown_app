import { Countdown } from "@prisma/client";
import { Request, Response } from "express";
import { z } from "zod";
import database from "../lib/database";
import { schemaType } from "../router";

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

  public static getCountdownByCategorySchema = z.object({
    query: z.object({
      p: z.preprocess(
        (value) =>
          value != undefined ? parseInt(z.string().parse(value)) : undefined,
        z.number().min(1)
      ),
      size: z.preprocess(
        (value) =>
          value != undefined ? parseInt(z.string().parse(value)) : undefined,
        z.number().min(1).max(48)
      ),
    }),
    params: z.object({}),
  });
  public static getCountdownByCategory = async (
    req: Request,
    res: Response
  ) => {
    try {
      const { id } = req.params;
      const { p, size } = req.query;
      const page = Number(p) || 1;
      const pageSize = Number(size) || 10;

      const countdowns: Countdown[] = await database.category
        .findUniqueOrThrow({
          where: {
            id,
          },
          select: {
            Countdowns: {
              take: pageSize,
              skip: (page - 1) * pageSize,
              where: { isPublic: true },
            },
          },
        })
        .then((category) => {
          return category?.Countdowns ?? [];
        });

      return res.status(200).json(countdowns);
    } catch (error) {
      return res.status(500).send("Error while getting countdowns by category");
    }
  };
}

export default CategoryController;
