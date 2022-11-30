import { Router } from "express";
import CategoryController from "./category/category_controller";

const router = Router();

router.get("/", (req, res) => {
  //Route to test if server is running
  res.status(200).send("OK");
});

router.get("/category", CategoryController.getCategories);
router.post("/category", CategoryController.createCategory);
router.get(
  "/category/:id/countdowns",
  CategoryController.getCountdownByCategory
);




export default router;
