window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener('input', () => {
    const price = parseFloat(priceInput.value);

    const tax = Math.floor(price * 0.1);
    const profitAmount = Math.floor(price - tax);

    addTaxPrice.textContent = tax.toLocaleString(); 
    profit.textContent = profitAmount.toLocaleString(); 
  });
});