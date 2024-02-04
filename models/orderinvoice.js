'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class orderInvoice extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  orderInvoice.init({
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
  return orderInvoice;
};