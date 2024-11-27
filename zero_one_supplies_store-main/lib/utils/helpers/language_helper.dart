import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';

class LanguageHelper {
  static const String welcome01SuppliesTransKey = 'welcome to 01 supplies';
  static const String helloThereSignInToContinueTransKey =
      'hello there, sign in to continue';
  static const String homeTransKey = 'home';
  static const String passwordTransKey = 'password';
  static const String analyticsOverviewTransKey = 'analytics overview';
  static const String totalSalesTransKey = 'total sales';
  static const String totalCustomersTransKey = 'total customers';
  static const String rememberMeTransKey = 'remember me';
  static const String forgotPasswordTransKey = 'forgot password';
  static const String dontHaveAnAccountTransKey = 'dont\'t have an account?';
  static const String responseIsNullTransKey = 'response is null!';
  static const String selectProductTransKey = 'select product';
  static const String searchProductTransKey = 'search product';
  static const String brandNameTransKey = 'brand name';
  static const String auctionProductTransKey = 'auction details';
  static const String totalProductsTransKey = 'total products';
  static const String earningsTransKey = 'earnings';
  static const String sendToBankTransKey = 'send to bank';
  static const String myAccountTransKey = 'my account';
  static const String editStoreInfoTransKey = 'edit store information';
  static const String insightTransKey = 'insight';
  static const String deleteAccountTransKey = 'delete account';

  static const String brandTransKey = 'brands';
  static const String myReviewsTransKey = 'my reviews';
  static const String supportTicketTransKey = 'support ticket';
  static const String termsAndConditionsTransKey = 'terms & conditions';
  static const String deliveryServiceTransKey = 'delivery services';
  static const String settingTransKey = 'settings';
  static const String signOutTransKey = 'sign out';
  static const String signInTransKey = 'sign in';
  static const String pastOrdersTransKey = 'past orders';
  static const String newOrdersTransKey = 'new orders';
  static const String noOrderFoundTransKey = 'no order found!';
  static const String cashOnDeliveryTransKey = 'cash on delivery';
  static const String myProductsTransKey = 'my products';
  static const String auctionsTransKey = 'auctions';
  static const String newProductsTransKey = 'new products';
  static const String updateBrandTransKey = 'update brand';
  static const String addBrandTransKey = 'add brand';
  static const String createNewPasswordTransKey = 'create new password';
  static const String createNewPassSubtitleTransKey =
      'Please enter your new password and confirm password';
  static const String newPassWordTransKey = 'new password';
  static const String confirmPasswordTransKey = 'confirm password';
  static const String atLeast6CharactersTransKey = 'at least 6 characters';
  static const String atLeast1NumberTransKey = 'contain at least 1 number';
  static const String savePasswordTransKey = 'save password';
  static const String greatPassChangedTransKey = 'great! password changed';
  static const String nowLogInTransKey = 'now log in';
  static const String startSellWithUsTransKey = 'start sell with us';
  static const String registerTransKey = 'register';
  static const String loginTransKey = 'login';
  static const String passWordRecoveryTransKey = 'password recovery';
  static const String pleaseConfirmYourEmailTransKey =
      'please confirm your email address';
  static const String emailAddressTransKey = 'email address';
  static const String sendCodeTransKey = 'send code';
  static const String pleaseConfirmYourPhoneNumberTransKey =
      'please confirm your country code and enter phone number';
  static const String resetYourPasswordTransKey = 'reset your password';
  static const String willBeSentTransKey = 'verification code will be sent.';
  static const String sendToYourMailTransKey = 'send to your mail';
  static const String sendToYourMailSubtitleTransKey =
      'password reset link has been sent to your mail';
  static const String sendToYourPhoneTransKey = 'send to your phone number';
  static const String sendToYourPhoneSubtitleTransKey =
      'password reset link has been sent to your phone number';
  static const String resetPasswordTransKey = 'reset password';
  static const String verificationTransKey = 'verification';
  static const String sentToNumberWhichIsTransKey =
      'verification code was sent to your number. which is';
  static const String sentToMailWhichIsTransKey =
      'verification code was sent to your email address. Which is';
  static const String resendCodeInTransKey = 'resend code in: ';
  static const String submitCodeTransKey = 'submit code';
  static const String resendTransKey = 'resend';
  static const String accountSuccessFullyCreatedTransKey =
      'your account is created successFully';
  static const String canLoginAccountTransKey =
      'now you can login your account and create your store';
  static const String addAuctionTransKey = 'add auction';
  static const String brandListTransKey = 'brand list';
  static const String auctionInfoTransKey = 'auction info';
  static const String apple12TransKey = 'eg: apple iPhone 12  ';
  static const String productCategoryTransKey = 'product category';
  static const String chooseCategoryTransKey = 'choose category';
  static const String chooseSubCategoryTransKey = 'choose sub category';
  static const String chooseChildCategoryTransKey = 'choose child category';
  static const String chooseProductUnitTransKey = 'choose product unit';
  static const String chooseDiscountTransKey = 'choose discount type';
  static const String descriptionTransKey = 'description';
  static const String descriptionSubtitleTransKey = 'item description here';
  static const String enterPriceTransKey = 'enter price here';
  static const String specificationTransKey = 'specifications';
  static const String chargingPowerTransKey = 'charging power';
  static const String touchScreenTransKey = 'touch screen';
  static const String ramTransKey = 'ram';
  static const String nextTransKey = 'next';
  static const String itemImageTransKey = 'item image';
  static const String uploadTransKey = 'upload';
  static const String addMoreImageTransKey = '+add more image';
  static const String startDateTransKey = 'start date';
  static const String startTimeTransKey = 'start time';
  static const String statusTransKey = 'status';
  static const String showStockTransKey = 'show stock';
  static const String flashSellTransKey = 'flash sell';
  static const String stockAvailableTransKey = 'available / stock available';
  static const String stockVisibilityTransKey = 'stock visibility';
  static const String noveltyTransKey = 'novelty';
  static const String onSellTransKey = 'on sale';
  static const String bestSaleTransKey = 'best sale';
  static const String topSaleTransKey = 'top sell';
  static const String featuredTransKey = 'featured';
  static const String popularTransKey = 'popular';
  static const String activeTransKey = 'active';
  static const String inActiveTransKey = 'inactive';
  static const String productActiveStatusTransKey = 'product active status';
  static const String productImageTransKey = 'product image';
  static const String thumbnailImageTransKey = 'thumbnail image';
  static const String galleryImageTransKey = 'gallery images';
  static const String shippingInformationTransKey = 'shipping information';
  static const String approxDeliveryTransKey =
      'approximate delivery time (in days)';
  static const String minimumShippingTransKey =
      'minimum amount for free shipping';
  static const String productReturnTimeTransKey =
      'product return time (in days)';
  static const String returnPolicySmsTransKey = 'return policy message';
  static const String approxDeliveryHintTransKey =
      'enter approximate delivery time';
  static const String minimumShippingHintTransKey = 'enter minimum amount';
  static const String productReturnTimeHintTransKey =
      'enter product return time';
  static const String returnPolicySmsHintTransKey =
      'enter return policy message';
  static const String searchProductHereTransKey = 'search product name here';
  static const String endDateTransKey = 'end date';
  static const String endTimeTransKey = 'end time';
  static const String setPriceTransKey = 'set price';
  static const String itemPriceTransKey = 'item price';
  static const String startBiddingAmountTransKey = 'start bidding amount*';
  static const String reservedPriceTransKey = 'Reserved Price*';
  static const String deliveryInfoTransKey = 'delivery info';
  static const String estimatedDeliveryDaysTransKey =
      'estimated delivery days *';
  static const String freeShippingTransKey = 'free shipping*';
  static const String returnDaysTransKey = 'return days*';
  static const String addBankTransKey = 'add bank';
  static const String bankInfoTransKey = 'bank info';
  static const String accountHolderNameTransKey = 'account holder name';
  static const String bankNameTransKey = 'bank name';
  static const String branchCodeTransKey = 'branch code';
  static const String accountNumberTransKey = 'account number';
  static const String addBankAccountTransKey = 'add bank account';
  static const String addCardTransKey = 'add card';
  static const String cardInfoTransKey = 'card info';
  static const String nameOnCardTransKey = 'name on card';
  static const String cardNumberTransKey = 'card number';
  static const String expirationTransKey = 'expiration';
  static const String postalCodeTransKey = 'postal code';
  static const String addPaypalTransKey = 'add paypal';
  static const String addProductTransKey = 'add product';
  static const String outOfStockTransKey = 'out of stock';
  static const String itemInfoTransKey = 'item info';
  static const String quantityTransKey = 'quantity';
  static const String itemTitleTransKey = 'item title';
  static const String productNameTransKey = 'product name';
  static const String unitQuantityTransKey = 'unit quantity';
  static const String enterProductUnitQuantityTransKey =
      'enter product unit quantity';
  static const String stockQuantityTransKey = 'stock quantity';
  static const String enterProductStockQuantityTransKey =
      'enter product stock unit quantity';
  static const String minimumPurchaseQuantityTransKey =
      'minimum purchase quantity';
  static const String enterMinimumPurchaseQuantityTransKey =
      'enter minimum purchase quantity';
  static const String stockAlertQuantityTransKey = 'stock alert quantity';
  static const String enterStockAlertQuantityTransKey =
      'enter stock alert quantity';
  static const String stockTransKey = 'stock';
  static const String addMoreOptionsTransKey = 'add more options';
  static const String skuTransKey = 'sku';
  static const String productModelTransKey = 'product model';
  static const String productSubcategoryTransKey = 'product subcategory';
  static const String productChildCategoryTransKey = 'product child category';
  static const String productUnitTransKey = 'product unit';
  static const String productTagsTransKey = 'product tags';
  static const String chooseTagsTransKey = 'choose tags';
  static const String colorTransKey = 'color';
  static const String sizeTransKey = 'size';
  static const String priceTransKey = 'price';
  static const String productPriceTransKey = 'product price';
  static const String enterProductPriceTransKey = 'enter product price';
  static const String discountTransKey = 'discount';
  static const String discountTypeTransKey = 'discount type';
  static const String enterDiscountValueTransKey = 'enter discount value';
  static const String setQualityBasedPriceTransKey = 'set quantity based price';
  static const String pageNotFoundTransKey = 'page not found';
  static const String detailsTransKey = 'details';
  static const String trackingTransKey = 'tracking';
  static const String orderStatusTransKey = 'order information';
  static const String trackingIdTransKey = 'tracking  id';
  static const String senderInfoTransKey = 'sender info';
  static const String senderNameTransKey = 'sender name';
  static const String addressTransKey = 'address';
  static const String phoneTransKey = 'phone';
  static const String productInfoTransKey = 'product info';
  static const String productTypeTransKey = 'product type';
  static const String productWeightTransKey = 'product weight';
  static const String productQuantityTransKey = 'product quantity';
  static const String amountToCollectTransKey = 'amount to collect';
  static const String costInfoTransKey = 'cost info ';
  static const String cashCollectionTransKey = 'cash collection';
  static const String codChargeTransKey = 'cod charge';
  static const String deliveryChargeTransKey = 'delivery Charge';
  static const String totalTransKey = 'total';
  static const String youReceivedTransKey = 'you received';
  static const String estimatedDeliveryTransKey = 'estimated delivery';
  static const String readyToDeliveredTransKey = 'ready to deliver';
  static const String storeReviewsTransKey = 'store reviews';
  static const String userReviewTransKey = 'user reviews';
  static const String mostUsefulTransKey = 'most useful';
  static const String newestTransKey = 'newest';
  static const String oldestTransKey = 'oldest';
  static const String basedOnTransKey = 'based on';
  static const String reviewsTransKey = 'reviews';
  static const String editTransKey = 'edit';
  static const String storeNotApprovedTransKey =
      'your store is not approved yet';
  static const String uploadStoreDetailsTransKey = 'update store details';
  static const String dontWorryTransKey =
      'don\'t worry! we\'ll let you know when your store approved. please wait until then.';
  static const String mostRelevantTransKey = 'most relevant';
  static const String minimumTransKey = 'minimum';
  static const String maximumTransKey = 'maximum';
  static const String addMoreTransKey = '+add more';
  static const String sellOfferTransKey = 'sell offer';
  static const String callingTransKey = 'calling';
  static const String congratsTransKey = 'congrats';
  static const String congratulationsTransKey = 'congratulations!';
  static const String goToHomeTransKey = 'go to home';
  static const String chatWithCustomerTransKey = 'chat with customer';
  static const String writeMessageTransKey = 'write message';
  static const String countryTransKey = 'country';
  static const String selectCountryTransKey = 'select country';
  static const String currencyTransKey = 'currency';
  static const String selectCurrencyTransKey = 'select currency';
  static const String deliveriesTransKey = 'deliveries';
  static const String deliverToTransKey = 'deliver to';
  static const String processingTransKey = 'processing';
  static const String deliveryPartnerAssignedTransKey =
      'delivery partner assigned';
  static const String itemsTransKey = 'items';
  static const String paymentInfoTransKey = 'payment info';
  static const String subTotalTransKey = 'sub total';
  static const String serviceFeeTransKey = 'service fee';
  static const String amountToPayTransKey = 'amount to pay';
  static const String readyToDeliverTransKey = 'ready to deliver';
  static const String createAPickupRequestTransKey = 'create a pickup request';
  static const String invoiceTransKey = 'invoice';
  static const String viewTransKey = 'view';
  static const String editAccountTransKey = 'edit account';
  static const String firstNameTransKey = 'first name';
  static const String lastNameTransKey = 'last name';
  static const String phoneNumberTransKey = 'phone number';
  static const String stockManagementTransKey = 'stock management';
  static const String currentStockTransKey = 'current stock';
  static const String typeTransKey = 'type';
  static const String subtractTransKey = 'subtract';
  static const String updateInfoTransKey = 'update info';
  static const String youDoneTransKey = 'youre done';
  static const String setupStoreInformationTransKey = 'setup store information';
  static const String storeNameTransKey = 'store name';
  static const String categoriesTransKey = 'category';
  static const String locationTransKey = 'location';
  static const String taxNameTransKey = 'tax name ';
  static const String taxNumberTransKey = 'tax number ';
  static const String nidNumberTransKey = 'nid number ';
  static const String storeLogoTransKey = 'store logo';
  static const String brandLogoTransKey = 'brand logo';
  static const String nationalIdentityNumberTransKey = 'national identity card';
  static const String addressProofTransKey = 'address proof';
  static const String applyNowTransKey = 'apply now';
  static const String preferenceTransKey = 'preference';
  static const String languageTransKey = 'language';
  static const String balanceTransKey = 'balance';
  static const String nameTransKey = 'name';
  static const String signUpTransKey = 'sign up';
  static const String sellerRegTransKey = 'seller Registration';
  static const String pickupRequestTransKey = 'pickup request';
  static const String productDetailsTransKey = 'product details ';
  static const String fragileTransKey = 'fragile';
  static const String liquidTransKey = 'liquid';
  static const String totalWeightTransKey = 'total weight';
  static const String totalQuantityTransKey = 'total quantity';
  static const String productDescriptionTransKey = 'production description';
  static const String submitTransKey = 'submit';
  static const String somethingErrorTransKey = 'something error happened';
  static const String passNotMassTransKey = 'passwords not match.';
  static const String imageTransKey = 'images';
  static const String genderTransKey = 'gender';
  static const String editProductTransKey = 'edit product';
  static const String categoryTransKey = 'category';
  static const String gettingStartedTransKey = 'getting started';
  static const String helloThereTransKey = 'hello there, sign up to continue';
  static const String yourNameTransKey = 'your name';
  static const String bySigningUpTransKey = 'by signing up, i agree to the ';
  static const String termsOfServiceTransKey = 'terms of service';
  static const String andSpacedTransKey = ' and ';
  static const String privacyPolicyTransKey = 'privacy policy';
  static const String alreadyHaveAnAccountTransKey = 'already have an account?';
  static const String ordersTransKey = 'orders';
  static const String rideTransKey = 'ride';
  static const String todayTransKey = 'today';
  static const String okeyTransKey = 'okey';
  static const String yesterdayTransKey = 'yesterday';
  static const String topSellingItemsTransKey = 'top selling items';
  static const String selectLanguageTransKey = 'select language';
  static const String walletTransKey = 'wallet';
  static const String saveWithdrawMethodTransKey = 'save withdraw method';
  static const String addNewTransKey = '+add new';
  static const String addNewBrandTransKey = 'add new';
  static const String recentTransactionsTransKey = 'recent transactions';
  static const String withdrawTransKey = 'withdraw';
  static const String enterAmountToTransferTransKey =
      'enter amount to transfer';
  static const String sendToCardTransKey = 'Send to card';
  static const String addAccountTransKey = 'add account';
  static const String paymentSummeryTransKey = 'payment summary';
  static const String trackingIDTransKey = 'tracking          id       :';
  static const String invoiceIDTransKey = 'invoice id:';
  static const String pickupRequestConfirmTransKey = 'pickup request confirm ';
  static const String yourPickupRequestIsPlacedTransKey =
      'your pickup request is successfully placed. tracking id:';
  static const String yourAddressTransKey = 'Your Address';
  static const String pickupAddressTransKey = 'pickup address';
  static const String pickupPhoneTransKey = 'pickup phone';
  static const String recipientDetailsTransKey = 'recipient details ';
  static const String recipientNameTransKey = 'recipient  name';
  static const String recipientPhoneTransKey = 'recipient  phone';
  static const String deliveryAreaTransKey = 'delivery area';
  static const String recipientAddressTransKey = 'recipient address* ';
  static const String preferredDeliveryTimeTransKey =
      'preferred delivery time ';
  static const String fullDayTransKey = 'full day';
  static const String morning9To1TransKey = 'morning 9 am To  1 pm';
  static const String afternoon3To9TransKey = 'afternoon 3 pm To 9 pm';
  static const String errorSavingPassTransKey = 'error saving password';
  static const String canNotBeEmptyTransKey = 'can not be empty';
  static const String minimumLengthTransKey = 'minimum length 3';
  static const String mustMatchConfirmTransKey =
      'must match with confirm password';
  static const String mustMatchPassPassTransKey = 'must match with password';
  static const String invalidEmailTransKey = 'invalid email format';
  static const String invalidNumberTransKey = 'invalid phone number format';
  static const String accountNotVerifiedTransKey =
      'your account is not verified yet!';
  static const String verifyNowTransKey = 'verify now';
  static const String userNotExistTransKey = 'user does not exist';
  static const String discountPriceStartDateTransKey =
      'discount price start date';
  static const String selectStartDateTransKey = 'select start date';
  static const String discountPriceEndDateTransKey = 'discount price end date';
  static const String selectEndDateTransKey = 'select end date';
  static const String shortDescriptionTransKey = 'short description';
  static const String enterShortDescriptionTransKey = 'enter short description';
  static const String longDescriptionTransKey = 'long description';
  static const String enterLongDescriptionTransKey = 'enter long description';
  static const String selectAttributeTransKey = 'select attribute';
  static const String attributeNameTransKey = 'attribute name';
  static const String selectAnAttributeTransKey = 'select an attribute';
  static const String attributeValuesTransKey = 'attribute values';
  static const String selectAttributeValuesTransKey = 'select values';
  static const String productSpecificationsTransKey = 'product specifications';
  static const String enterNameTransKey = 'enter name';
  static const String valueTransKey = 'value';
  static const String enterValueTransKey = 'enter value';
  static const String addSpecificationTransKey = 'add specification';
  static const String deleteTransKey = 'delete';
  static const String exampleTransKey = 'eg';
  static const String messageTransKey = 'message';
  static const String localeCodeTransKey = Constants.languageTranslationKeyCode;

  static final Map<String, String> fallBackEnglishTranslation = {
    welcome01SuppliesTransKey: 'Welcome to 01 Supplies',
    errorSavingPassTransKey: 'Error Saving Password',
    mustMatchConfirmTransKey: 'Must match with confirm password',
    accountNotVerifiedTransKey: 'Your account is not verified yet!',
    verifyNowTransKey: 'Verify now',
    userNotExistTransKey: 'User Does Not Exist',
    mustMatchPassPassTransKey: 'Must match with password',
    invalidEmailTransKey: 'Invalid email format',
    invalidNumberTransKey: 'Invalid phone number format',
    minimumLengthTransKey: 'Minimum length 3',
    passNotMassTransKey: 'passwords not match.',
    responseIsNullTransKey: 'Response is null!',
    somethingErrorTransKey: 'Something error happened!',
    homeTransKey: 'Home',
    analyticsOverviewTransKey: 'Analytics overview',
    totalSalesTransKey: 'Total Sales',
    totalCustomersTransKey: 'Total customers',
    totalProductsTransKey: 'Total products',
    earningsTransKey: 'Earnings',
    sendToBankTransKey: 'Send to bank',
    myAccountTransKey: 'My account',
    editStoreInfoTransKey: 'Edit store information',
    insightTransKey: 'Insight',
    brandTransKey: 'Brands',
    okeyTransKey: 'okey',
    myReviewsTransKey: 'My reviews',
    supportTicketTransKey: 'Support Ticket',
    termsAndConditionsTransKey: 'Terms & conditions',
    deliveryServiceTransKey: 'Delivery services',
    settingTransKey: 'Settings',
    signOutTransKey: 'Sign out',
    signInTransKey: 'Sign In',
    pastOrdersTransKey: 'Past orders',
    newOrdersTransKey: 'New orders',
    noOrderFoundTransKey: 'No Order found!',
    cashOnDeliveryTransKey: 'Cash on delivery',
    myProductsTransKey: 'My Products',
    auctionsTransKey: 'Auctions',
    newProductsTransKey: 'New Products',
    createNewPasswordTransKey: 'Create new password',
    createNewPassSubtitleTransKey:
        'Please enter your new password and confirm password',
    newPassWordTransKey: 'New password',
    confirmPasswordTransKey: 'Confirm password',
    atLeast6CharactersTransKey: 'At least 6 characters',
    atLeast1NumberTransKey: 'Contain at least 1 number',
    savePasswordTransKey: 'Save password',
    greatPassChangedTransKey: 'Great! Password changed',
    nowLogInTransKey: 'Now Log In',
    stockAvailableTransKey: 'Available / Stock available ',
    stockVisibilityTransKey: 'Stock Visibility',
    startSellWithUsTransKey: 'Start Sell With Us!',
    registerTransKey: 'Register',
    loginTransKey: 'Login',
    passWordRecoveryTransKey: 'Password recovery',
    pleaseConfirmYourEmailTransKey: 'Please confirm your email address',
    emailAddressTransKey: 'Email address',
    sendCodeTransKey: 'Send code',
    pleaseConfirmYourPhoneNumberTransKey:
        'Please confirm your country code and enter phone number',
    resetYourPasswordTransKey: 'Reset your password',
    willBeSentTransKey: 'Verification code will be sent.',
    sendToYourMailTransKey: 'Send to your mail',
    sendToYourMailSubtitleTransKey:
        'Password reset link has been sent to your mail',
    sendToYourPhoneTransKey: 'Send to your phone number',
    sendToYourPhoneSubtitleTransKey:
        'Password reset link has been sent to your phone number',
    resetPasswordTransKey: 'Reset password',
    verificationTransKey: 'Verification',
    sentToNumberWhichIsTransKey:
        'Verification code was sent to your number. Which is',
    sentToMailWhichIsTransKey:
        'Verification code was sent to your email address. Which is',
    resendCodeInTransKey: 'Resend code in: ',
    submitCodeTransKey: 'Submit code',
    resendTransKey: 'Resend',
    accountSuccessFullyCreatedTransKey: 'Your Account is Created SuccessFully',
    canLoginAccountTransKey:
        'Now you Can Login your account and Create Your Store',
    addAuctionTransKey: 'Add Auction',
    brandListTransKey: 'Brand List',
    auctionInfoTransKey: 'Auction info',
    apple12TransKey: '  eg: Apple iPhone 12  ',
    productCategoryTransKey: 'Product Category',
    descriptionTransKey: 'Description',
    descriptionSubtitleTransKey: 'Item Description Here',
    specificationTransKey: 'Specifications',
    chargingPowerTransKey: 'Charging Power',
    touchScreenTransKey: 'Touch Screen',
    ramTransKey: 'Ram',
    nextTransKey: 'Next',
    itemImageTransKey: 'Item Image',
    uploadTransKey: 'Upload',
    addMoreImageTransKey: '+Add More Image',
    startDateTransKey: 'Start date',
    endDateTransKey: 'End date',
    itemPriceTransKey: 'Item Price',
    startBiddingAmountTransKey: 'Start Bidding Amount*',
    reservedPriceTransKey: 'Reserved Price*',
    deliveryInfoTransKey: 'Delivery Info',
    estimatedDeliveryDaysTransKey: 'Estimated Delivery Days *',
    freeShippingTransKey: 'Free Shipping*',
    returnDaysTransKey: 'Return Days*',
    addBankTransKey: 'Add Bank',
    bankInfoTransKey: 'Bank Info',
    accountHolderNameTransKey: 'Account Holder Name',
    bankNameTransKey: 'Bank Name',
    branchCodeTransKey: 'Branch Code',
    addBankAccountTransKey: 'Add  Bank Account',
    addCardTransKey: 'Add Card',
    cardInfoTransKey: 'Card Info',
    nameOnCardTransKey: 'Name On Card',
    cardNumberTransKey: 'Card Number',
    expirationTransKey: 'Expiration',
    postalCodeTransKey: 'Postal Code',
    addPaypalTransKey: 'Add Paypal',
    addProductTransKey: 'Add Product',
    outOfStockTransKey: 'Out of stock',
    itemInfoTransKey: 'Item info',
    itemTitleTransKey: 'Item title',
    unitQuantityTransKey: 'Unit quantity',
    enterProductUnitQuantityTransKey: 'enter product unit quantity',
    stockQuantityTransKey: 'Stock quantity',
    enterProductStockQuantityTransKey: 'enter product stock unit quantity',
    minimumPurchaseQuantityTransKey: 'Minimum purchase quantity',
    enterMinimumPurchaseQuantityTransKey: 'enter minimum purchase quantity',
    stockAlertQuantityTransKey: 'Stock alert quantity',
    enterStockAlertQuantityTransKey: 'enter stock alert quantity',
    stockTransKey: 'Stock',
    addMoreOptionsTransKey: 'Add more options',
    skuTransKey: 'SKU',
    productModelTransKey: 'Product model',
    brandNameTransKey: 'Brand name',
    productSubcategoryTransKey: 'Product subcategory',
    productChildCategoryTransKey: 'Product child category',
    productUnitTransKey: 'Product unit',
    productTagsTransKey: 'Product tags',
    chooseTagsTransKey: 'Choose tags',
    colorTransKey: 'Color',
    sizeTransKey: 'Size',
    priceTransKey: 'Price',
    setQualityBasedPriceTransKey: 'Set Quantity Based Price',
    pageNotFoundTransKey: 'Page Not Found',
    detailsTransKey: 'Details',
    trackingTransKey: 'tracking',
    orderStatusTransKey: 'order information',
    trackingIdTransKey: 'Tracking  Id',
    senderInfoTransKey: 'Sender Info',
    senderNameTransKey: 'Sender Name',
    addressTransKey: 'Address',
    phoneTransKey: 'Phone',
    productInfoTransKey: 'Product Info',
    productWeightTransKey: 'Product Weight',
    amountToCollectTransKey: 'Amount to Collect',
    productQuantityTransKey: 'Product Quantity',
    cashCollectionTransKey: ' Cash Collection',
    deliveryChargeTransKey: '  Delivery Charge',
    totalTransKey: '  Total',
    youReceivedTransKey: 'you received',
    estimatedDeliveryTransKey: 'Estimated Delivery',
    readyToDeliveredTransKey: 'Ready To Deliver',
    storeReviewsTransKey: 'Store Reviews',
    basedOnTransKey: 'Based on',
    userReviewTransKey: 'User reviews',
    mostUsefulTransKey: 'Most Useful',
    newestTransKey: 'Newest',
    oldestTransKey: 'Oldest',
    mostRelevantTransKey: 'Most relevant',
    reviewsTransKey: 'reviews',
    storeNotApprovedTransKey: 'Your Store is not Approved Yet',
    uploadStoreDetailsTransKey: 'Update Store Details',
    dontWorryTransKey:
        'Don\'t Worry! We\'ll let you know when your store approved. Please wait until then.',
    minimumTransKey: 'Minimum',
    maximumTransKey: 'Maximum',
    addMoreTransKey: '+Add More',
    sellOfferTransKey: 'Sell Offer',
    callingTransKey: 'Calling',
    congratsTransKey: 'Congrats',
    congratulationsTransKey: 'Congratulations!',
    goToHomeTransKey: 'Go to Home',
    chatWithCustomerTransKey: 'Chat with customer',
    writeMessageTransKey: 'Write message',
    countryTransKey: 'Country',
    selectCountryTransKey: 'Select Country',
    currencyTransKey: 'Currency',
    selectCurrencyTransKey: 'Select Currency',
    deliveriesTransKey: 'Deliveries',
    deliverToTransKey: 'Deliver To',
    processingTransKey: 'Processing',
    deliveryPartnerAssignedTransKey: 'Delivery partner assigned',
    itemsTransKey: 'Items',
    paymentInfoTransKey: 'Payment info',
    subTotalTransKey: 'Sub total',
    serviceFeeTransKey: 'Service fee',
    amountToPayTransKey: 'Amount to pay',
    createAPickupRequestTransKey: 'Create A Pickup Request',
    invoiceTransKey: 'Invoice',
    viewTransKey: 'View',
    editAccountTransKey: 'Edit account',
    firstNameTransKey: 'First name',
    lastNameTransKey: 'Last name',
    phoneNumberTransKey: 'Phone Number',
    stockManagementTransKey: 'stock management',
    currentStockTransKey: 'Current Stock',
    quantityTransKey: 'Quantity',
    typeTransKey: 'Type',
    subtractTransKey: 'Subtract',
    updateInfoTransKey: 'Update Info',
    youDoneTransKey: 'You\'re done!',
    helloThereSignInToContinueTransKey: 'Hello there, sign in to continue',
    passwordTransKey: 'password',
    rememberMeTransKey: 'Remember me',
    forgotPasswordTransKey: 'Forgot password',
    dontHaveAnAccountTransKey: 'Don\'t have and account?',
    setupStoreInformationTransKey: 'Setup Store Information',
    storeNameTransKey: 'Store Name',
    locationTransKey: 'Location',
    taxNameTransKey: 'Tax name ',
    taxNumberTransKey: 'Tax Number ',
    nidNumberTransKey: 'Nid Number ',
    storeLogoTransKey: 'Store Logo',
    brandLogoTransKey: 'Brand Logo',
    nationalIdentityNumberTransKey: 'National Identity card',
    addressProofTransKey: 'Address Proof',
    applyNowTransKey: 'Apply Now',
    preferenceTransKey: 'Preference',
    languageTransKey: 'Language',
    balanceTransKey: 'Balance',
    nameTransKey: 'Name',
    signUpTransKey: 'Sign up',
    sellerRegTransKey: 'Seller Registration',
    fragileTransKey: 'Fragile',
    liquidTransKey: 'Liquid',
    totalWeightTransKey: 'Total Weight',
    totalQuantityTransKey: 'Total Quantity',
    productDescriptionTransKey: 'Production Description ',
    submitTransKey: 'Submit',
    genderTransKey: 'Gender',
    editProductTransKey: 'Edit product',
    categoryTransKey: 'Category',
    gettingStartedTransKey: 'Getting Started',
    helloThereTransKey: 'Hello there, sign up to continue',
    yourNameTransKey: 'Your name',
    bySigningUpTransKey: 'By signing up, I agree to the ',
    termsOfServiceTransKey: 'Terms of service',
    andSpacedTransKey: ' and ',
    privacyPolicyTransKey: 'Privacy policy',
    alreadyHaveAnAccountTransKey: 'Already have an account?',
    ordersTransKey: 'Orders',
    rideTransKey: 'Ride',
    todayTransKey: 'Today',
    yesterdayTransKey: 'Yesterday',
    topSellingItemsTransKey: 'Top selling items',
    selectLanguageTransKey: 'Select language',
    walletTransKey: 'Wallet',
    saveWithdrawMethodTransKey: 'Save Withdraw Method',
    addNewTransKey: '+Add New',
    addNewBrandTransKey: 'Add New',
    recentTransactionsTransKey: 'Recent transactions',
    withdrawTransKey: 'Withdraw',
    enterAmountToTransferTransKey: 'enter Amount to Transfer',
    sendToCardTransKey: 'Send to card',
    addAccountTransKey: 'Add Account',
    paymentSummeryTransKey: 'Payment Summary',
    trackingIDTransKey: 'Tracking          ID       :',
    invoiceIDTransKey: 'Invoice Id:',
    pickupRequestTransKey: 'Pickup Request',
    pickupRequestConfirmTransKey: 'Pickup Request Confirm ',
    yourPickupRequestIsPlacedTransKey:
        'Your pickup request is successfully placed. Tracking Id:',
    yourAddressTransKey: 'Your Address',
    pickupAddressTransKey: 'Pickup Address',
    pickupPhoneTransKey: 'Pickup Phone',
    recipientDetailsTransKey: 'Recipient Details ',
    recipientNameTransKey: 'Recipient  Name',
    recipientPhoneTransKey: 'Recipient  Phone',
    deliveryAreaTransKey: 'Delivery Area',
    recipientAddressTransKey: 'Recipient Address* ',
    preferredDeliveryTimeTransKey: 'Preferred Delivery Time ',
    fullDayTransKey: 'Full Day',
    morning9To1TransKey: 'Morning 9 AM To  1 PM',
    afternoon3To9TransKey: 'Afternoon 3 PM To 9 PM',
    productPriceTransKey: 'Product price',
    enterProductPriceTransKey: 'enter product price',
    discountTransKey: 'Discount',
    enterDiscountValueTransKey: 'enter discount value',
    discountPriceStartDateTransKey: 'Discount price start date',
    selectStartDateTransKey: 'Select start date',
    discountPriceEndDateTransKey: 'Discount price end date',
    selectEndDateTransKey: 'Select end date',
    shortDescriptionTransKey: 'Short description',
    enterShortDescriptionTransKey: 'enter short description',
    longDescriptionTransKey: 'Long description',
    enterLongDescriptionTransKey: 'enter long description',
    selectAttributeTransKey: 'Select attribute',
    attributeNameTransKey: 'Attribute name',
    selectAnAttributeTransKey: 'select an attribute',
    attributeValuesTransKey: 'Attribute values',
    selectAttributeValuesTransKey: 'Select values',
    productSpecificationsTransKey: 'Product specifications',
    enterNameTransKey: 'enter name',
    valueTransKey: 'Value',
    addBrandTransKey: 'add brand',
    updateBrandTransKey: 'Update Brand',
    enterValueTransKey: 'enter value',
    discountTypeTransKey: 'Discount type',
    addSpecificationTransKey: 'Add specification',
    deleteTransKey: 'Delete',
    productNameTransKey: 'Product name',
    exampleTransKey: 'Eg',
    messageTransKey: 'Message',
    selectProductTransKey: 'Select Product',
    searchProductTransKey: 'Search Product',
    auctionProductTransKey: 'Auction Details',
    startTimeTransKey: 'Start time',
    endTimeTransKey: 'End time',
    setPriceTransKey: 'Set price',
    showStockTransKey: 'Show stock',
    flashSellTransKey: 'Flash Sell',
    noveltyTransKey: 'Novelty',
    onSellTransKey: 'On Sale',
    editTransKey: 'edit',
    bestSaleTransKey: 'Best Sale',
    topSaleTransKey: 'top sell',
    featuredTransKey: 'Featured',
    popularTransKey: 'Popular',
    productActiveStatusTransKey: 'Product active status',
    activeTransKey: 'Active',
    inActiveTransKey: 'Inactive',
    imageTransKey: 'Images',
    productImageTransKey: 'Product Image',
    thumbnailImageTransKey: 'Thumbnail Image',
    galleryImageTransKey: 'Gallery Images',
    shippingInformationTransKey: 'Shipping Information',
    approxDeliveryTransKey: 'Approximate delivery time (in days)',
    minimumShippingTransKey: 'Minimum amount for free shipping',
    productReturnTimeTransKey: 'Product return time (in days)',
    returnPolicySmsTransKey: 'Return policy message',
    approxDeliveryHintTransKey: 'Enter approximate delivery time',
    minimumShippingHintTransKey: 'Enter minimum amount',
    productReturnTimeHintTransKey: 'Enter product return time',
    returnPolicySmsHintTransKey: 'Enter return policy message',
    chooseSubCategoryTransKey: 'Choose sub category',
    chooseChildCategoryTransKey: 'Choose child category',
    chooseDiscountTransKey: 'Choose discount type',
    enterPriceTransKey: 'Enter price here',
    searchProductHereTransKey: 'search product name here',
    statusTransKey: 'Status',
    localeCodeTransKey: 'en_US',
    //=====new
    deleteAccountTransKey : 'Delete Account',
  };

  static String currentLanguageText(String translationKey) {
    final dynamic currentLanguageName =
        AppSingleton.instance.localBox.get(Constants.hiveDefaultLanguageKey);
    if (currentLanguageName is! String) {
      return fallbackText(translationKey);
    }
    final dynamic currentLanguageTranslations =
        AppSingleton.instance.localBox.get(currentLanguageName);
    if (currentLanguageTranslations is! Map<String, String>) {
      return fallbackText(translationKey);
    }
    final String? translatedText = currentLanguageTranslations[translationKey];
    if (translatedText == null) {
      return fallbackText(translationKey);
    }
    return translatedText;
  }

  static String fallbackText(String translationKey) =>
      AppLanguageTranslation.fallBackEnglishTranslation[translationKey] ?? '';
}
