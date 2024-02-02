'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('orderInvoices', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      orderId: {
        type: Sequelize.STRING
      },
      billingName: {
        type: Sequelize.STRING
      },
      paymentStatus: {
        type: Sequelize.STRING,
          type: Sequelize.ENUM('Awaiting Authorization', 'Paid', 'Payment Failed'),
          allowNull: true,
          defaultValue: 'Awaiting Authorization',
      },
      total: {
        type: Sequelize.STRING
      },
      paymentMethod: {
        type: Sequelize.STRING
      },
      orderStatus: {
        type: Sequelize.ENUM('Processing', 'Shipped', 'Delivered', 'Cancelled'),
        allowNull: true,
        defaultValue: 'Processing',
      },      
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('orderInvoices');
  }
};