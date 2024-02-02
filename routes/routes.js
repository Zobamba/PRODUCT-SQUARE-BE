import billingInfoRoutes from "./billing-info-routes";
import invoiceRoutes from "./invoice-routes";

export default function routes(app) {
  billingInfoRoutes(app);
  invoiceRoutes(app)
}