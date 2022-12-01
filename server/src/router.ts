import { Router, Request, Response, NextFunction } from "express";
import { z, ZodError, ZodObject } from "zod";
import CategoryController from "./category/category_controller";

const router = Router();

router.get("/", (req, res) => {
  //Route to test if server is running
  res.status(200).send("OK");
});

const validateSchema = (schema: ZodObject<any>) => {
  return (req: Request, res: Response, next: NextFunction) => {
    try {
      const { body, query, params } = req;
      schema.parse({ body, query, params });
      next();
    } catch (error) {
      res.status(400).send((error as ZodError).message);
    }
  };
};

router.get("/category", CategoryController.getCategories);
router.post("/category", CategoryController.createCategory);
router.get(
  "/category/:id/countdowns",
  validateSchema(CategoryController.getCountdownByCategorySchema),
  CategoryController.getCountdownByCategory
);

export default router;
