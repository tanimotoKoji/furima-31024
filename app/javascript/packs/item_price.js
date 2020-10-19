window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxValue = document.getElementById("add-tax-price");
    const taxValue = Math.floor(inputValue * 0.1);
    addTaxValue.innerHTML = taxValue;
    profit.innerHTML = Math.floor(inputValue - taxValue);
  })

});

