function tabsSelection () {
    const tabs = document.querySelectorAll(".tabs-selector");

    tabs.forEach((tab) => {
        console.log(tab);
        tab.addEventListener("click", (event) => {
        console.log("clicked");
        const currentActiveTabSelector = document.querySelector(".tabs-selector-active");
        const currentInactiveTabSelector = document.querySelector(".tabs-selector-inactive");
        const currentActiveTab = document.querySelector(".active-tab");
        const currentInactiveTab = document.querySelector(".inactive-tab");
        if (currentActiveTabSelector !== event.currentTarget) {
            currentActiveTabSelector.classList.toggle("tabs-selector-active");
            currentActiveTabSelector.classList.toggle("tabs-selector-inactive");
            currentInactiveTabSelector.classList.toggle("tabs-selector-active");
            currentInactiveTabSelector.classList.toggle("tabs-selector-inactive");
            currentActiveTab.classList.toggle("active-tab");
            currentActiveTab.classList.toggle("inactive-tab");
            currentInactiveTab.classList.toggle("active-tab");
            currentInactiveTab.classList.toggle("inactive-tab");
        };
        });
    });
};

export { tabsSelection };

