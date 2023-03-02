import 'package:form_field_validator/form_field_validator.dart';

const isDarkModeOnPref = 'isDarkModeOnPref';
const imageBaseApi =
    'https://healthstaticbucket210034-dev.s3.ap-south-1.amazonaws.com/public/';
const imagePlaceHolder =
    'http://2.bp.blogspot.com/-MowVHfLkoZU/VhgIRyPbIoI/AAAAAAAATtI/fHk-j_MYUBs/s640/placeholder-image.jpg';

/// Validation
///

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);

const String STATES =
    '[{"value": "AN","name": "Andaman and Nicobar Islands"},{"value": "AP","name": "Andhra Pradesh"},{"value": "AR","name": "Arunachal Pradesh"},{"value": "AS","name": "Assam"},{"value": "BR","name": "Bihar"},{"value": "CH","name": "Chandigarh"},{"value": "CG","name": "Chhattisgarh"},{"value": "DN","name": "Dadra and Nagar Haveli"},{"value": "DD","name": "Daman and Diu"},{"value": "DL","name": "Delhi"},{"value": "GA","name": "Goa"},{"value": "GJ","name": "Gujarat"},{"value": "HR","name": "Haryana"},{"value": "HP","name": "Himachal Pradesh"},{"value": "JK","name": "Jammu and Kashmir"},{"value": "JH","name": "Jharkhand"},{"value": "KA","name": "Karnataka"},{"value": "KL","name": "Kerala"},{"value": "LA","name": "Ladakh"},{"value": "LD","name": "Lakshadweep"},{"value": "MP","name": "Madhya Pradesh"},{"value": "MH","name": "Maharashtra"},{"value": "MN","name": "Manipur"},{"value": "ML","name": "Meghalaya"},{"value": "MZ","name": "Mizoram"},{"value": "NL","name": "Nagaland"},{"value": "OR","name": "Odisha"},{"value": "PY","name": "Puducherry"},{"value": "PB","name": "Punjab"},{"value": "RJ","name": "Rajasthan"},{"value": "SK","name": "Sikkim"},{"value": "TN","name": "Tamil Nadu"},{"value": "TS","name": "Telangana"},{"value": "TR","name": "Tripura"},{"value": "UP","name": "Uttar Pradesh"},{"value": "UK","name": "Uttarakhand"},{"value": "WB","name": "West Bengal"}]';

const String COUNTRIES = '[{"name": "India", "value": "IN"}]';
