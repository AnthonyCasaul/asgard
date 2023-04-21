const list1 = document.querySelector("#AddpreferedDays");
const list2 = document.querySelector("#EditpreferedDays");
const list3 = document.querySelector("#profList");
const list4 = document.querySelector("#Editproflist");
const list5 = document.querySelector("#sublist");
const list6 = document.querySelector("#Editsublist");

if(list1){
    list1.addEventListener("click", function(e) {
        if (e.target && e.target.nodeName === "LI") {
          list1.removeChild(e.target);
        }
      });
}

if(list2){
    list2.addEventListener("click", function(e) {
        if (e.target && e.target.nodeName === "LI") {
          list2.removeChild(e.target);
        }
      });
}

if(list3){
    list3.addEventListener("click", function(e) {
        if (e.target && e.target.nodeName === "LI") {
          list3.removeChild(e.target);
        }
      });
}

if(list4){
    list4.addEventListener("click", function(e) {
        if (e.target && e.target.nodeName === "LI") {
          list4.removeChild(e.target);
        }
      });
}

if(list5){
    list5.addEventListener("click", function(e) {
        if (e.target && e.target.nodeName === "LI") {
          list5.removeChild(e.target);
        }
      });
}

if(list6){
    list6.addEventListener("click", function(e) {
        if (e.target && e.target.nodeName === "LI") {
          list6.removeChild(e.target);
        }
      });
}
