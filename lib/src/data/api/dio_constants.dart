class DioConstants {
  static const String baseURL = "https://apiv2stg.promilo.com/user/oauth/token";

  // End points
  static const String apiLogin = '/users';
  static const String apiSearchCustomer = '/Customer/SearchCustomer';
  static const String apiAddCustomer = '/Customer';
  static const String apiUpdateCustomer = '/Customer/UpdateCustomer';
  static const String apiGetSalesReport = '/Invoice/GetIncomeReport';
  static const String apiGetMeasurementDetails =
      '/Measurement/GetMeasurementByInvoiceNo';
  static const String apiSearchMeasurement = '/Invoice/SearchMeasurement';
  static const String apiGetMeasurementByOrderId =
      '/Measurement/GetMeasurementByOrderNo';
  static const String apiUpdatOrder = '/Invoice/UpdateOrder';
  static const String apiOrderDropDownData =
      '/Measurement/GetOrderDropDownData';
  static const String apiUpdateMeasurement = '/Measurement/UpdateMeasurement';
  static const String apiAddMeasurement = '/Measurement/AddMeasurement';
  static const String apiCreateOrder = '/Invoice/CreateInvoice';
  static const String apiUpdateInvoiceNumber = '/Invoice/UpdateInvoiceNumber';
  static const String apiDropDownData = '/Measurement/GetDropDownData';
  static const String apiDeleteCustomer = '/Customer/DeleteCustomer';
}
