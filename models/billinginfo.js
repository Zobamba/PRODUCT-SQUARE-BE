'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class billingInfo extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  billingInfo.init({
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
  return billingInfo;
};