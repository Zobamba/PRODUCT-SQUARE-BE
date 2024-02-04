import orderInvoice from '../models/orderinvoice.js'
import sequelize from 'sequelize';

const { Op } = sequelize;

class InvoiceController {
  getAllInvoice(req, res) {
    const { offset, limit, searchKey } = req.query;
    const queryLimit = limit;
    const queryOffset = offset || 0;
    
    const whereCondition = searchKey === undefined ? {} : {
      [Op.or]: {
        billingName: { [Op.iLike]: `%${searchKey}%` },
        paymentMethod: { [Op.iLike]: `%${searchKey}%` },
        orderStatus: sequelize.literal(`"orderInvoice"."orderStatus"::text ILIKE '%${searchKey}%'`),
      },
    };
  
    orderInvoice.count({ where: whereCondition }).then((count) => {
      orderInvoice.findAll({
        order: sequelize.literal('id DESC'),
        offset: queryOffset,
        limit: queryLimit,
        where: whereCondition,
      }).then((invoices) => {
        res.status(200).send({
          invoices,
          count,
          limit: queryLimit,
          offset: queryOffset,
        });
      }).catch((error) => {
        console.log(error);
        res.status(500).send({ error: 'Internal Server Error' });
      });
    });
  }
  
  getInvoiceByOrderStatus(req, res) {
    const { offset, limit, orderStatus } = req.query;
    const queryLimit = limit;
    const queryOffset = offset || 0;
    const queryOrderStatus = sequelize.literal(`"orderInvoice"."orderStatus"::text ILIKE '%${orderStatus}%'`);

    orderInvoice.count({ where: { orderStatus: queryOrderStatus } }).then((count) => {
      orderInvoice.findAll({
        order: sequelize.literal('id DESC'),
        offset: queryOffset,
        limit: queryLimit,
        where: { orderStatus: queryOrderStatus },
      }).then((invoices) => {
        res.status(200).send({
          invoices,
          count,
          limit: queryLimit,
          offset: queryOffset,
        });
      }).catch((error) => {
        console.log(error);
        res.status(500).send({ error: 'Internal Server Error' });
      });
    });
  }
}

export default new InvoiceController();