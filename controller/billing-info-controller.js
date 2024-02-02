import models from '../models';
import { v4 as uuidv4 } from 'uuid';

const { billingInfo, orderInvoice } = models;

class BillingController {
  postBillingInfo(req, res, next) {
    billingInfo.create({
      firstName: req.body.firstName,
      lastName: req.body.lastName,
      email: req.body.email,
      phone: req.body.phone,
      address: req.body.address,
      city: req.body.city,
      state: req.body.state,
      zip: req.body.zip,
      country: req.body.country,
      orderNotes: req.body.orderNotes,
      cardNumber: req.body.cardNumber,
      nameOnCard: req.body.nameOnCard,
      expiryDate: req.body.expiryDate,
      cvv: req.body.cvv,
    }).then((billInfo) => {
      res.status(201).send({
        id: billInfo.id,
        firstName: billInfo.firstName,
        lastName: billInfo.lastName,
        email: billInfo.email,
        phone: billInfo.phone,
        address: billInfo.address,
        city: billInfo.city,
        state: billInfo.state,
        zip: billInfo.zip,
        country: billInfo.country,
        orderNotes: billInfo.orderNotes,
        cardNumber: billInfo.cardNumber,
        nameOnCard: billInfo.nameOnCard,
        expiryDate: billInfo.expiryDate,
        cvv: billInfo.cvv,
        message: 'Billing info created successfully',
      });

    return next();
    }).catch((error) => {
      console.log(error);
      return next(error);
    })
  }

  postInvoice(req, res) {
    orderInvoice.create({
      orderId: uuidv4(),
      billingName: req.body.firstName + ' ' + req.body.lastName,
      // paymentStatus: 'Payment Failed',
      total: 115,
      paymentMethod: 'Credit Card',
      // orderStatus: 'Cancelled'
    }).then(() => {
      return;
    }).catch((error) => {
      console.log(error);

      res.status(500).send({ error: 'Internal Server Error' });
    });
  
  }

}

export default new BillingController();