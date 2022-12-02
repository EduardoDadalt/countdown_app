import * as z from "zod"
import { CompleteCountdown, RelatedCountdownModel } from "./index"

export const CategoryModel = z.object({
  id: z.string().cuid(),
  name: z.string(),
  isPublic: z.boolean(),
})

export interface CompleteCategory extends z.infer<typeof CategoryModel> {
  Countdowns: CompleteCountdown[]
}

/**
 * RelatedCategoryModel contains all relations on your model in addition to the scalars
 *
 * NOTE: Lazy required in case of potential circular dependencies within schema
 */
export const RelatedCategoryModel: z.ZodSchema<CompleteCategory> = z.lazy(() => CategoryModel.extend({
  Countdowns: RelatedCountdownModel.array(),
}))
