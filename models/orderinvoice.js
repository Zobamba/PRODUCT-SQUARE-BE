// orderinvoice.js
'use strict';
import { Model, DataTypes } from 'sequelize';

export default (sequelize) => {
  class OrderInvoice extends Model {
    static associate(models) {
      // define association here
    }
  }

  OrderInvoice.init({
    orderId: DataTypes.STRING,
    billingName: DataTypes.STRING,
    paymentStatus: {
      type: DataTypes.STRING,
    },
    total: DataTypes.STRING,
    paymentMethod: DataTypes.STRING,
    orderStatus: {
      type: DataTypes.STRING,
    },
  }, {
    sequelize,
    modelName: 'orderInvoice',
  });

  return OrderInvoice;
};
