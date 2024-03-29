import InvoiceController from "../controller/invoice-controller";

export default function invoiceRoutes(app) {
  app.get('/invoices', InvoiceController.getAllInvoice);
  app.get('/status-invoices', InvoiceController.getInvoiceByOrderStatus);
}