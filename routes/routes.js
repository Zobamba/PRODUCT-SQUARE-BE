import billingInfoRoutes from "./billing-info-routes.js";
import invoiceRoutes from "./invoice-routes.js";

export default function routes(app) {
  billingInfoRoutes(app);
  invoiceRoutes(app)
}