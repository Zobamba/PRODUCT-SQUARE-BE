// billinginfo.js
'use strict';
import { Model, DataTypes } from 'sequelize';

export default (sequelize) => {
  class BillingInfo extends Model {
    static associate(models) {
      // define association here
    }
  }

  BillingInfo.init({
    firstName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    email: DataTypes.STRING,
    phone: DataTypes.STRING,
    address: DataTypes.STRING,
    city: DataTypes.STRING,
    state: DataTypes.STRING,
    zip: DataTypes.INTEGER,
    country: DataTypes.STRING,
    orderNotes: DataTypes.TEXT,
    cardNumber: DataTypes.STRING,
    nameOnCard: DataTypes.STRING,
    expiryDate: DataTypes.DATE,
    cvv: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'billingInfo',
  });  

  return BillingInfo;
};
