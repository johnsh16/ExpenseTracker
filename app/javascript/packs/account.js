(() =>  {
    console.log('ding')
    let filterContainer = document.querySelector("#filter-button-container")
    filterContainer.style.hidden = true
    filterContainer.addEventListener('clicked', () => {
        console.log('ding')
        if (filterContainer.style.hidden == false) {
            filterContainer.style.hidden = true
        } else {
            filterContainer.style.hidden = false
        }
    })
})()