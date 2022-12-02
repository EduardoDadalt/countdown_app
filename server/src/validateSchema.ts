import { Request, Response, NextFunction } from "express";
import { ZodError, ZodObject } from "zod";

export type schemaType = ZodObject<{
  body?: ZodObject<any>;
  query?: ZodObject<any>;
  params?: ZodObject<any>;
}>;

export const validateSchema = (schema: schemaType) => {
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
