import billingInfoController from "../controller/billing-info-controller.js";

export default function billingInfoRoutes(app) {
app.post('/post-billing-info', billingInfoController.postBillingInfo, billingInfoController.postInvoice);
}