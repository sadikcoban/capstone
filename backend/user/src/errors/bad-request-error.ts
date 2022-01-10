import { CustomError } from "./custom-error";

export class BadRequestError extends CustomError {
  statusCode = 400;
  constructor(public msg: string) {
    super();
    this.msg = msg;

    // Only because extending a built in class
    Object.setPrototypeOf(this, BadRequestError.prototype);
  }
  serializeErrors() {
    return [this.msg];
  }
}
