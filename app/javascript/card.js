const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("item_order[number]"),
      cvc: formData.get("item_order[cvc]"),
      exp_month: formData.get("item_order[exp_month]"),
      exp_year: `20${formData.get("item_order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("item_order_number").removeAttribute("name");
        document.getElementById("item_order_cvc").removeAttribute("name");
        document.getElementById("item_order_exp_month").removeAttribute("name");
        document.getElementById("item_order_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        document.getElementById("item_order_number").removeAttribute("name");
        document.getElementById("item_order_cvc").removeAttribute("name");
        document.getElementById("item_order_exp_month").removeAttribute("name");
        document.getElementById("item_order_exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }
    });
  });
};

window.addEventListener("load", pay); 