console.log("it works!");

function openTab(tab) {
    let i, tabContent;
    tabContent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabContent.length; i++) {
        tabContent[i].style.display = "none";
    }
    document.getElementById(tab).style.display = "flex";
  }