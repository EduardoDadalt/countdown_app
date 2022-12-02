import * as z from "zod"
import { CompleteCategory, RelatedCategoryModel } from "./index"

export const CountdownModel = z.object({
  id: z.string().cuid(),
  title: z.string(),
  date: z.date(),
  isPublic: z.boolean(),
  createdAt: z.date(),
  updatedAt: z.date(),
  categoryId: z.string().cuid(),
})

export interface CompleteCountdown extends z.infer<typeof CountdownModel> {
  category: CompleteCategory
}

/**
 * RelatedCountdownModel contains all relations on your model in addition to the scalars
 *
 * NOTE: Lazy required in case of potential circular dependencies within schema
 */
export const RelatedCountdownModel: z.ZodSchema<CompleteCountdown> = z.lazy(() => CountdownModel.extend({
  category: RelatedCategoryModel,
}))
