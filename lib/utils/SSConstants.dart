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
