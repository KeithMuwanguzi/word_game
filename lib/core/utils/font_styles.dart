import 'package:word_game/core/utils/size_utils.dart';

double getUltraSmallFont(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 13.fSize;
  } else {
    return 7.fSize;
  }
}

double getSmallFont(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 16.fSize;
  } else {
    return 10.fSize;
  }
}

double getMediumFont(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 18.fSize;
  } else {
    return 12.fSize;
  }
}

double getLargeFont(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 20.fSize;
  } else {
    return 14.fSize;
  }
}

double getFieldSize(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 50.v;
  } else {
    return 35.v;
  }
}

double getButtonSize(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 45.v;
  } else {
    return 25.v;
  }
}

double getSocialButtonHeight(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 40.v;
  } else {
    return 25.v;
  }
}

double getSocialButtonWidth(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 300.h;
  } else {
    return 280.h;
  }
}

double getSmallSizes(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 20.adaptSize;
  } else {
    return 10.adaptSize;
  }
}

double getMediumSizes(deviceType) {
  if (deviceType == DeviceType.mobile) {
    return 30.adaptSize;
  } else {
    return 20.adaptSize;
  }
}
