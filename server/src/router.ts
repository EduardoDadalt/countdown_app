import { Router } from "express";
import CategoryController from "./category/category_controller";
import CountdownController from "./countdown/countdown_controller";
import { validateSchema } from "./validateSchema";

const router = Router();

router.get("/", (req, res) => {
  //Route to test if server is running
  res.status(200).send("OK");
});

router.get("/category", CategoryController.getCategories);
router.post("/category", CategoryController.createCategory);
router.get(
  "/category/:id/countdowns",
  validateSchema(CategoryController.getCountdownByCategorySchema),
  CategoryController.getCountdownByCategory
);

router.post(
  "/countdown",
  validateSchema(CountdownController.createCountdownSchema),
  CountdownController.createCountdown
);

export default router;
