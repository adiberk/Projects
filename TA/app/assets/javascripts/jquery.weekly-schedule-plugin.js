// (function ($) {
//     $.fn.weekly_schedule = function(callerSettings) {

//         var settings = $.extend({
//             days: ["sun", "mon", "tue", "wed", "thu", "fri", "sat"], // Days displayed
//             hours: "7:00AM-10:00PM", // Hours displyed
//             fontFamily: "Montserrat", // Font used in the component
//             fontColor: "black", // Font colot used in the component
//             fontWeight: "100", // Font weight used in the component
//             fontSize: "0.8em", // Font size used in the component
//             hoverColor: "#727bad", // Background color when hovered
//             selectionColor: "#9aa7ee", // Background color when selected
//             headerBackgroundColor: "transparent", // Background color of headers
//             onSelected: function(){}, // handler called after selection
//             onRemoved: function(){} // handler called after removal
//         }, callerSettings||{});


//         var mousedown = false;
//         var devarionMode = false;

//         var schedule = this;

//         function getSelectedHour() {
//             var dayContainer = $('.day');
//             var output = {};
//             for (var i = 0; i < dayContainer.length; i++) {
//                 var children = $(dayContainer[i]).children();

//                 var hoursSelected = [];
//                 for (var j = 0; j < children.length; j++) {
//                     if ($(children[j]).hasClass('selected')) {
//                         hoursSelected.push(children[j]);
//                     }
//                 }
//                 output[i] = hoursSelected;
//             }
//             console.log("output");
//             return output;
//         }

//         if (typeof callerSettings == 'string') {
//             switch (callerSettings) {
//                 case 'getSelectedHour':
//                 console.log("MEEEEEEEEEEEEEEEEEEEEE");
//                     return getSelectedHour();
//                     break;
//                 default:
//                     throw 'Weekly schedule method unrecognized!'
//             }
//         }
//         // options is an object, initialize!
//         // else {
//         //     // Prevent Right Click
//         //     $('.schedule').on('contextmenu', function() {
//         //         return false;
//         //     });

//         //     $('.hour').on('mouseenter', function() {
//         //         var count = 0;
//         //         if (!mousedown) {
//         //             $(this).addClass('hover');
//         //         }
//         //         else {
//         //             if (devarionMode) {
//         //                 $(this).removeClass('selected');
//         //             }
//         //             else {
//         //                 $(this).addClass('selected');
//         //             }
//         //         }
//         //     }).on('mousedown', function() {
//         //         mousedown = true;
//         //         focusOn($(this).parent());

//         //         if ($(this).hasClass('selected')) {
//         //             schedule.trigger('selectionremoved')
//         //             $(this).removeClass('selected');
//         //             time = $(this).children().remove()
//         //             console.log(time)
//         //             devarionMode = true;
//         //         }
//         //         else {
//         //             schedule.trigger('selectionmade')
//         //             $(this).addClass('selected');
//         //             $(this).addClass('counter');
//         //             $(this).append("<h4 class = 'time-added'>HELLO</h4>");

//         //         }
//         //         $(this).removeClass('hover');
//         //     }).on('mouseup', function() {
//         //         devarionMode = false;
//         //         mousedown = false;
//         //         clearFocus();
//         //     }).on('mouseleave', function () {
//         //         if (!mousedown) {
//         //             $(this).removeClass('hover');
//         //         }
//         //     });

//         // }

//         function focusOn(day) {
//             var targetDayClass = $(day).attr('class').split('\ ')[1];
//             var dayContainer = $('.day');

//             for (var i = 0; i < dayContainer.length; i++) {
//                 if ($(dayContainer[i]).hasClass(targetDayClass)) {
//                     continue;
//                 }
//                 console.log("HEYP");
//                 var hours = $(dayContainer[i]).children();
//                 for (var j = 0; j < hours.length; j++) {
//                     $(hours[j]).addClass('disabled');
//                 }
//             }

//             $(day).on('mouseleave', function() {
//                 clearFocus();
//                 console.log("Hover");
//                 mousedown = false;
//                 devarionMode = false;
//             });
//         }

//         function clearFocus() {
//             var dayContainer = $('.day');

//             for (var i = 0; i < dayContainer.length; i++) {

//                 var hours = $(dayContainer[i]).children();
//                 for (var j = 0; j < hours.length; j++) {
//                     $(hours[j]).removeClass('disabled');
//                 }
//             }
//         }

//     };
// }(jQuery));
