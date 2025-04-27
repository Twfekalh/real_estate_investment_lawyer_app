enum ServicesResponseStatues {
  success,
  networkError,
  unauthorized,
  someThingWrong,
}

final serviceValues = {
  ServicesResponseStatues.success: "Sent Successfully",
  ServicesResponseStatues.networkError: "Connection error !",
  ServicesResponseStatues.unauthorized: "Unauthorized",
  ServicesResponseStatues.someThingWrong: "Something went wrong !",
};
