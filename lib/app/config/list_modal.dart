// ignore_for_file: camel_case_types



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/images.dart';

class modal{

  List tcTitle = [
    "Privacy Policy",
    "Payment",
    "License Usage",
    "Product Updates",
    "Media",
    "Cookies",
    "Support"
  ];

  List termconditions = [
    "We committed to protecting your privacy. This Privacy Policy explains how we collect, use, and disclose information about you when you use our website, mobile application, or other online services. By accessing or using the Service, you agree to the collection, use, and disclosure of your information as described in this Privacy Policy. If you do not agree with the terms of this Privacy Policy, please do not use the Service.",
    "Payment is the process by which a buyer transfers funds or assets to a seller as compensation for goods, services, or obligations. It is an essential component of economic transactions and plays a vital role in facilitating trade and commerce.",
    "License usage plays a critical role in governing the legal rights and obligations associated with the use of software, intellectual property, and other protected assets. By understanding the terms and conditions of license agreements and ensuring compliance with usage restrictions, individuals and organizations can mitigate legal risks and protect the integrity of intellectual property rights.",
    "A product update refers to a release of new features, improvements, or bug fixes for a software application, mobile app, or other product. It is a crucial aspect of product management and development, allowing companies to enhance the functionality, performance, and user experience of their offerings.",
    "Ensure that all media content is accessible to users with disabilities by providing alternative text for images, captions for videos, and keyboard navigation for interactive elements.Animations, including transitions, effects, and interactive animations, add fluidity, feedback, and visual interest to software interfaces. They improve usability, guide user interactions, and provide feedback on actions.",
    "This website uses cookies to enhance the user experience and provide personalized content and services. By using this website, you consent to the use of cookies in accordance with this policy.",
    "We are committed to providing timely and effective support to our users to ensure a positive experience with our products/services. This section outlines how we handle support inquiries and the privacy implications associated with accessing support."
  ];

  // Sales History List

  List pricingContent = [
    "Advanced Analytics",
    "Standard customer support",
    "Priority Support",
    "Training and Resources",
    "Maximum fee discounts",
    "Advanced Marketing Tools",
    "Lower transaction fees"
  ];

  List pricingsubtitle = [
    "",
    "",
    "Enjoy 24/7 priority support from our dedicated team.", // Priority Support
    "Access exclusive webinars, tutorials, and guides to enhance your selling skills.", // Training and Resources
    "",
    "Utilize our suite of marketing tools to promote your products.", // Advanced Marketing Tools
    ""
  ];

  List pricingmoney = [
    "\$ 249","\$ 199","\$ 179","\$ 149","\$ 125","\$ 99"
  ];

  List subType = [
    "Gold",
    "Platinum",
    "Diamond",
    "Titanium",
    "Platinum",
    "Diamond"
  ];

  List testImage = [
    Appcontent.sales1,
    Appcontent.sales2,
    Appcontent.sales3,
    Appcontent.sales4,
    Appcontent.sales5,
    Appcontent.sales3,
    Appcontent.sales1,
    Appcontent.sales2,
    Appcontent.sales3,
  ];

  List sImg =[
    Appcontent.sales1,
    Appcontent.sales2,
    Appcontent.sales3,
    Appcontent.sales4,
    Appcontent.sales5,
    Appcontent.sales3,
  ];

  List profileIcons = [
    Appcontent.userIcon,
    Appcontent.settingsIcon,
    Appcontent.dollarIcon,
    Appcontent.activityIcon,
    Appcontent.bellIcon,
  ];

  List tooltip = [
    "Create",
    "Edit",
    "Delete"
  ];

  List profileText = [
     "Profile",
    "Settings",
    "Billing",
    "Activity",
    "Help"
  ];

  List sTitle =[
    'Alon musk',
    'Raj-veer pose',
    'karma Builders',
    'Rajvi Opel',
    'Raj-veer pose',
  ];
  List subTitle =[
    'Iphone 15 Pro',
    'hp Monitor',
    'iPad Pro 2020',
    'Laxmi Restaurant',
    'hp Monitor',
  ];

  List blog = [
    Appcontent.blog1,
    Appcontent.blog2,
    Appcontent.blog3,
    Appcontent.blog4,
    Appcontent.blog3,
    Appcontent.blog1,
    Appcontent.blog4,
    Appcontent.blog2
  ];
  // Notification Menu List
  List noImg =[
    Appcontent.people1,
    Appcontent.people2,
    Appcontent.people3,
    Appcontent.people1,
    Appcontent.people2,
    Appcontent.people3,
  ];
  List noTitle =[
    'Elon Musk',
    'San Furious',
    'ms puiyi',
    'Bertram William',
    'Christopher',
    'Darcy',
  ];
  List amt =[
    '+\$52.36',
    '+\$12.96',
    '+\$69.45',
    '+\$78.52',
    '+\$96.44',
    '+\$63.14',
  ];

  // Analyics Lists
  List anImg =[
    Appcontent.rocket,
    Appcontent.rotate,
    Appcontent.timer,
  ];
  List anTitle =[
    'USER VISIT',
    'SESSIONS',
    'TIME ON SITE',
  ];
  List percentage =[
    '+40%',
    '-10%',
    '+80%',
  ];
  List anAmt =[
    '57.711',
    '12.563',
    '66.856',
  ];

  // LocationUser List
  List loImg =[
    Appcontent.africa,
    Appcontent.indonesia,
    Appcontent.spain,
    Appcontent.arabic,
    Appcontent.america,
  ];
  List loText =[
    'Africa',
    'Indonesia',
    'Spain',
    'Arabic',
    'America',
  ];
  List loAmt =[
    '23,554/45%',
    '13,632/35%',
    '36,654/55%',
    '75,451/70%',
    '7,601/7%',
  ];
  List per =[
    45,
    35,
    55,
    70,
    7,
  ];
  List<Color> loColor =[
    const Color(0xff86E3D8),
    const Color(0xff86B1E3),
    const Color(0xffFAE31B),
    const Color(0xffFFAC5F),
    const Color(0xffFF7575),
  ];

  // User Device Lists
  List deImg =[
    Appcontent.android,
    Appcontent.mac,
    Appcontent.laptop,
    Appcontent.computer,
  ];
  List deText =[
    'Mobile',
    'Tablet',
    'Laptop',
    'Computer',
  ];
  List deUser =[
    '1232',
    '523',
    '5562',
    '4521',
  ];

  // Sale Dashboard Lists
  List saText =[
    'TODAY REVENUE',
    'TOTAL ORDER',
    'TOTAL PAYOUT',
  ];
  List saAmt =[
    '\$23.577.22',
    '13.577',
    '\$23.566.11',
  ];

  // Sales1 History List
  List sImg1 =[
    Appcontent.sales1,
    Appcontent.sales2,
    Appcontent.sales3,
    Appcontent.sales1,
    Appcontent.sales2,
    Appcontent.sales3,
    Appcontent.sales1,
  ];
  List sTitle1 =[
    'Alon musk',
    'Raj-veer pose',
    'karma Builders',
    'Rajvi Opel',
    'Raj-veer pose',
    'karma Builders',
    'Alon musk',
  ];
  List subTitle1 =[
    'Iphone 15 Pro',
    'hp Monitor',
    'iPad Pro 2020',
    'Laxmi Restaurant',
    'hp Monitor',
    'iPad Pro 2020',
    'hp Monitor',
  ];

  // Product Overview Lists
  List productImg =[
    Appcontent.category1,
    Appcontent.category2,
    Appcontent.category3,
    Appcontent.category4,
    Appcontent.category5,
    Appcontent.category6,
  ];
  List productTitle =[
    'Shoes',
    'Skating',
    'Headphone',
    'Score',
    'iPhone',
    'Tablet',
  ];

  List pagesContent = [
    "Start with a hook, like a surprising fact or bold statement.",
    "How tool is helping you for a easy content writing",
    "Read more tagline of SEO market's concepts",
    "How's help you to understand the Beyond & Basics",
    "Provides SEO insights for better keyword optimization",
    "Read more tagline of SEO market's concepts",
    "How tool is helping you for a easy content writing",
    "Start with a hook, like a surprising fact or bold statement.",
  ];

  List faqtitle = [
    "How can I contact customer support?",
    "What payment methods do you accept?",
    "Do you offer refunds? If yes, what is the process?",
    "How do I upgrade my subscription plan?",
    "Can multiple users access software under one account?",
    "How do I cancel my subscription to software?",
    "How does software design differ from software development?",
  ];

  List langImage = [
    'assets/L-English.png',
    'assets/L-Spanish.png',
    'assets/L-Arabic.png',
    'assets/L-Hindi-Gujarati.png',
    'assets/L-Hindi-Gujarati.png',
    'assets/L-Afrikaans.png',
    'assets/L-Bengali.png',
    'assets/L-Indonesion.png',
  ];



  // Pages List
  List pages = [
    "Blog",
    "Faq",
    "Pricing",
    "Testimonial",
    "Term & Conditions",
    "Sign In",
    "Sign Up",
    "Forget Password",
    "Two Step Verification",
    "Error",
    "Coming Soon",
    "Maintenance",
    "Blank Page"
  ];

  // Withdraw Cost Lists
  List withdrawImg =[
    Appcontent.withdrawBg1,
    Appcontent.withdrawBg2,
  ];
  List withdrawText =[
    'MONTHLY REVENUE',
    'PREVIOUS  WITHDRAW',
  ];
  List withdrawCost=[
    '\$23.577',
    '\$13.577',
  ];

  // Follower Lists
  List followImg =[
    Appcontent.boy14,
    Appcontent.girl17,
    Appcontent.boy18,
    Appcontent.girl18,
    Appcontent.boy14,
    Appcontent.girl17,
    Appcontent.boy18,
    Appcontent.girl18,
    Appcontent.girl18,
    Appcontent.boy14,
  ];
  List followName =[
    'Elon Musk',
    'ms puiyi',
    'Gopal Singh',
    'Jacqueline',
    'Elon Musk',
    'ms puiyi',
    'Gopal Singh',
    'Jacqueline',
    'Gopal Singh',
    'Jacqueline',
  ];
  List followSubTitle =[
    'India',
    'China',
    'Brazil',
    'India',
    'Austerity',
    'London',
    'Philippines',
    'India',
    'Canada',
    'Vadodara',
  ];

  // Inbox selected Lists
  List inboxImg =[
    Appcontent.inbox,
    Appcontent.draft,
    Appcontent.archive,
    Appcontent.delete,
  ];
  List inboxTitle =[
    'Inbox',
    'Draft',
    'Archive',
    'Deleted',
  ];

  // Settings Selection Lists
  List settingsImg =[
    Appcontent.fluentPassword,
    Appcontent.roundPayment,
    Appcontent.notificationActive,
  ];
  List settingsTitle =[
    'Password',
    'Payment',
    'Notification',
  ];

  List accountWidgets = [
    "Billing",
    "Application",
    "Invoice",
    "Setting"
  ];
  
  List<Uri> urlList = [
    Uri.parse("https://www.google.com/"),
    Uri.parse("https://www.facebook.com/"),
    Uri.parse("https://discord.com/"),
  ];

  // Notification Lists
  List notificationText =[
    'Privacy',
    'Payments',
    'Security',
    'Like & Comment',
    'Report & Spam',
  ];
  List<bool> toggle =[
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> toggle1 =[
    false,
    false,
    false,
    false,
    false,
  ];

  /// ------  Dashboard V1 Lists  ------
  // Status List
  List statusImg =[
    Appcontent.sEarning,
    Appcontent.sCurrency,
    '',
    '',
    Appcontent.sTask,
    Appcontent.sProject,
  ];
  List statusTitle =[
   'Earnings',
   'Spend this month',
   'Sales',
   'Your balance',
   'New Tasks',
   'Total Projects',
  ];
  List statusAmt =[
    '\$455.1',
    '\$542.15',
    '\$455.15',
    '\$1500',
    '160',
    '3200',
  ];
  // Tasks Lists
  List taskTitle =[
    'Splash Page',
    'Dashboard Build',
    'UI / UX Design',
    'PhotoShop',
    'Promotion',
    'Karma Builders',
  ];

  List taskCheck = [false,false,false,false,false,false];
  // Trending NFTs Lists
  List nfts =[
    'All',
    'Music',
    'Collections',
    'Sports',
  ];
  List nftImg =[
    Appcontent.trendingBg1,
    Appcontent.trendingBg2,
    Appcontent.trendingBg3,
  ];

  List recentlyadded = [
    Appcontent.trendingBg4,
    Appcontent.trendingBg5,
    Appcontent.trendingBg6,
  ];

  List nftTitle =[
    'freebsd'.tr,
    'AI Machine'.tr,
    'Canvas design'.tr,
  ];
  List nftSub =[
    'By Elon musk',
    'By ms puiyi',
    'By Jackson Smith',
  ];
  // NFTs history Lists
  List historyImg =[
    Appcontent.trendingBg1,
    Appcontent.trendingBg2,
    Appcontent.trendingBg3,
    Appcontent.trendingBg1,
    Appcontent.trendingBg2,
    Appcontent.trendingBg3,
  ];
  List historyTitle =[
    'freebsd',
    'AI Machine',
    'Canvas design',
    'freebsd',
    'AI Machine',
    'Canvas design',
  ];
  List historySub =[
    'By Elon musk',
    'By ms puiyi',
    'By Jackson Smith',
    'By Elon musk',
    'By ms puiyi',
    'By Jackson Smith',
  ];

  /// ---------- Kanban Lists ----------
  // backlog Lists
  List backlogTitle =[
    "Option to 'use local/server version' feature",
    "Add/modify your own CSS-Selectors",
    "Shortcode for templates to display correctly",
  ];
  List backlogSubtitle =[
    'It usually displays this message when you close an unsaved page when you do it on purpose, and it getting frustrated to see this every time.',
    'Website Design: The ability to add/modify your own CSS-Selectors like its done in Venus.',
    'When you save some sections as a template and then paste a shortcode to a new page, the layout is broken, some styles are missing - in the editor.',
  ];
  List backlogStatus =[
    'UPDATES',
    'PENDING',
    'ERRORS',
  ];
  List<Color> statusColor =[
    blue,
    yellow,
    red,
  ];

  // In progress Lists
  List progressTitle =[
    "General ideas to improve 'Edit' workflow",
    "Shortcode for templates to display correctly",
    "[UX Design] - Set the default Library tab",
  ];
  List progressSubtitle =[
    'Currently, I have a few templates in the Local Library and when I want to add them I am always presented (by default).',
    'When you save some sections as a template and then paste a shortcode to a new page, the layout is broken, some styles are missing - in the editor.',
    'Website Design: The ability to add/modify your own CSS-Selectors like its done in Venus.',
  ];

  List progressStatus =[
    'PENDING',
    'UPDATES',
    'ERRORS',
  ];

  List<Color> progressColor =[
    yellow,
    blue,
    red,
  ];
  // Done List
  List doneTitle =[
    "Copy/Paste elements between pages",
    "Remove Extra DIV for each container added",
    "Add Figma files for the Library design blocks",
  ];
  List doneSubtitle =[
    'We can only copy/paste elements (or group of elements) in the same page, which is quite limited.',
    'I still hope there will have an extra div for each container we added. It should be something for better styling...',
    'Website Design: The ability to add/modify your own CSS-Selectors like its done in Venus.',
  ];
  // Projects Lists
  List projectImg =[
    Appcontent.blockchain,
    Appcontent.economy,
    Appcontent.burnout,
  ];
  List projectTitle =[
    'Technology behind the Blockchain',
    'Greatest way to a good Economy',
    'Most essential tips for Burnout',
  ];
  // General Lists
  List generalTitle =[
    'Education',
    'Languages',
    'Department',
    'Work History',
    'Organization',
    'Birthday',
  ];
  List generalSubtitle =[
    'Oxford University',
    'English, USA',
    'Accounted',
    'Google',
    'Oxford',
    '10 Jun 1985',
  ];
  // Notifications Lists
  List notification = [
    'Item update notifications',
    'Item comment notifications',
    'Buyer review notifications',
    'Rating reminders notifications',
    'Meetups near you notifications',
    'Company news notifications',
    'New launches and projects',
    'Monthly product changes',
    'Subscribe to newsletter',
  ];

  /// Billing Lists
  // Card List
  List cardNumber = [
    '5412 XXXX XXXX XXXX',
    '4125 XXXX XXXX XXXX',
    '5639 XXXX XXXX XXXX',
  ];
  List cardValid = [
    '06/24',
    '08/24',
    '01/24',
  ];
  List cardCvv = [
    '095',
    '845',
    '121',
  ];
  List billTitle =[
    'Transfer',
    'Top Up',
    'Pay Bills',
    'More',
    'History'
  ];
  List paymentImg =[
    Appcontent.transfer,
    Appcontent.plus,
    Appcontent.dollar,
    Appcontent.moreHorizontal,
    Appcontent.history
  ];
  List<Color> paymentColor =[
    blue,
    yellow,
    greenCyan,
    red,
    coffee
  ];
  // Overall Lists
  List overallImage = [
    Appcontent.billTaxes,
    Appcontent.carEnergy
  ];

  List overallTitle =[
    'Bill & Taxes',
    'Car Energy',
  ];
  List overallDate =[
    'Today, 16:36',
    '23 July, 23:06',
  ];
  List overallAmt =[
    '-151.40',
    '-90.40',
  ];
  // invoice Lists
  List invoiceDate =[
    'Jan, 27 2023',
    'Jan, 10 2021',
    'Jun, 05 2015',
    'Dec, 25 2024',
    'Jan, 02 2022',
    'March, 23 2014',
    'Dec, 25 2024',
    'Dec, 15 2024',
  ];
  List invoiceAmt =[
    '\$562',
    '\$125',
    '\$452',
    '\$233',
    '\$521',
    '\$985',
    '\$233',
    '\$263',
  ];
  // transations Lists
  List transTitle= [
    'Utter Transport',
    'Apple Store',
    'Disney+ Hotstar',
    'Utter Transport',
    'Domino Cafe',
    'Money Transfer',
    'Deposit Check',
  ];
  List transDate= [
    '30 June 2021',
    '23 June 2021',
    '15 June 2021',
    '15 June 2021',
    '12 June 2021',
    '05 June 2021',
    '03 June 2021',
  ];
  List transAmt= [
    '-\$25.60',
    '-\$35.40',
    '-\$15.20',
    '-\$02.6',
    '-\$2.31',
    '-\$2.31',
    '-\$75.60',
  ];
  // Market Lists
  List marketTitle =[
    'ASKS',
    'DC VF',
    'TTML',
    'GB NH',
    'BNB',
    'TTML',
    'PFE',
  ];
  List marketAmt =[
    '551.4',
    '121.0',
    '5231.5',
    '521.4',
    '2563.10',
    '121.2',
    '523.1',
  ];
  List marketPrice =[
    '+3.16',
    '+5.12',
    '-5.62',
    '-5.21',
    '+3.21',
    '-1.21',
    '+7.65',
  ];
  // Transfer Lists
  List transferTitle =[
    'From Elon musk',
    'To Amit fid',
    'To Diff vfd',
    'From Austin Koji',
    'From Mos-am Hji',
    'To Pooh Foothill',
  ];
  List transferDay =[
    'Today, 15:32',
    'Today, 05:12',
    'Yesterday, 15:36',
    'Yesterday, 06:41',
    'Friday, 05:26',
    'Friday, 20:45',
  ];
  List transferAmt =[
    '-\$30',
    '+\$60',
    '+\$160',
    '+\$95',
    '-\$21',
    '-\$15',
  ];

  /// Application Screen Lists
  // Application Lists
  List title =[
    'Total Income',
    'Spending',
    'Activity',
    'Total Projects',
  ];
  List price =[
    '\$5.321',
    '\$2.354',
    '5.254',
    '750',
  ];
  List appPerchatage =[
    '+30%',
    '-15%',
    '+50%',
    '+25%',
  ];
  List applicationImg =[
    Appcontent.chartBar,
    Appcontent.fileCopy,
    Appcontent.fileCopy,
    Appcontent.chartBar,
  ];

  /// Settings Lists
  // authentication Lists
  List authTitle =[
    'Authenticator App',
    'Security Keys',
    'Security Keys',
    'Telephone Number',
  ];
  List configure = [
    'Not configured',
    'Not keys added',
    'Not keys added',
    '+1 52364125',
  ];
  List newsTitle =[
    'Weekly newsletter',
    'Lifecycle emails',
    'Promotional emails',
    'Product updates',
  ];
  List newsSubtitle =[
    'Get notified about articles, discounts and new products.',
    'Get personalized offers and emails based on your activity.',
    'Get personalized offers and emails based on your orders & preferences.',
    'Checking this will allow us to notify you when we make updates to products you have downloaded/purchased.',
  ];
  // Sessions Lists
  List sessionText =[
    'Chrome, Bucharest 68.128.072.301',
    'Chrome MacOS (Your current session)',
    'Firefox on Desktop, Barcelona',
    'Safari on Iphone',
  ];
  List sessionCountry =[
    'US',
    'IN',
    'EU',
    'LD',
  ];
  // connected Lists
  List connectText =[
    'Google',
    'Twitter',
    'Instagram',
    'Facebook',
  ];
  List coConfigure =[
    'Enabled',
    'Not configured',
    'Not configured',
    'Not configured',
  ];

  // Product Page Images
  List image = [
    Appcontent.productImage,
    Appcontent.productImage1,
    Appcontent.productImage2,
    Appcontent.productImage3,
    Appcontent.productImage4,
    Appcontent.productImage5,
  ];

  // News Feed Lists
  List newsImg =[
    Appcontent.sales1,
    Appcontent.sales2,
    Appcontent.sales3,
    Appcontent.sales4,
    Appcontent.sales5,
    Appcontent.sales2,
    Appcontent.sales4,
    Appcontent.sales3,
    Appcontent.sales1,
    Appcontent.sales5,
  ];
  List newsName =[
    'Semson',
    'Alenster',
    'Christian',
    'Jayveer Knot',
    'Rs Memon',
    'Simran J',
    'Mr Rajeev',
    'Ranbeer',
    'S Mohsin',
    'Gurpal Singh',
  ];

  // Trending Feed Lists
  List feedList =[
    Appcontent.trendingBg2,
    Appcontent.feed2,
    Appcontent.trendingBg3,
    Appcontent.feed1,
    Appcontent.trendingBg1,
    Appcontent.feed3,
  ];

  // Dropdown Lists
  List position =[
    'All'.tr,
    'Designer',
    'Editor',
    'Developer',
  ];
  List addressName =[
    'All'.tr,
    'Gujarat',
    'Singapore',
    'Canada',
  ];
  List statusName =[
    'All'.tr,
    'Full Time'.tr,
    'Remote'.tr,
    'Part Time'.tr,
  ];

  List personName =[
    'Amit bh-att',
    'names quit',
    'fast ghat',
  ];
}