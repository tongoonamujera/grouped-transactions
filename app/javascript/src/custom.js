// window.onload = function(){

//   var acc = document.getElementsByClassName("menu-bars");
//   var i;

//   for (i = 0; i < acc.length; i++) {
//     acc[i].addEventListener("click", function() {
//       this.classList.toggle("active");

//       var panel = this.nextElementSibling;
//       if (panel.style.display === "block") {
//         panel.style.display = "none";
//       } else {
//         panel.style.display = "block";
//       }
//     });
//   }
// }


// document.onreadystatechange = function () {
//   if (document.readyState === 'complete') {
//     var acc = document.getElementsByClassName("menu-bars");
//     var i;

//     for (i = 0; i < acc.length; i++) {
//       acc[i].addEventListener("click", function() {
//         this.classList.toggle("active");

//         var panel = this.nextElementSibling;
//         if (panel.style.display === "block") {
//           panel.style.display = "none";
//         } else {
//           panel.style.display = "block";
//         }
//       });
//     }
//   } else {
//     window.onload = function (){
//       var acc = document.getElementsByClassName("menu-bars");
//       var i;

//       for (i = 0; i < acc.length; i++) {
//         acc[i].addEventListener("click", function() {
//           this.classList.toggle("active");

//           var panel = this.nextElementSibling;
//           if (panel.style.display === "block") {
//             panel.style.display = "none";
//           } else {
//             panel.style.display = "block";
//           }
//         });
//       };
//     };
//   }
// }