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
      const { id } = req.params; // Get the id of category from url
      const { p } = req.query; // p is the page number
      const sizeOfPage = 10; // Number of countdowns per page
      const countdowns: Countdown[] = await database.category
        .findUniqueOrThrow({
          where: {
            id: String(id),
          },
          select: {
            Countdowns: {
              take: sizeOfPage,
              skip: (Number(p) - 1) * sizeOfPage,
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
