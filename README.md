## Acme Widget Co Sales System

This Ruby-based application calculates the total cost of a shopping basket while considering the prices of products, special offers, and delivery charges based on the total basket price. It aims to help businesses like Acme Widget Co. provide pricing, discounts, and delivery cost structures efficiently.

## How It Works

- Products: A catalog of products with unique codes, names, and prices.mode toggle
- Delivery Rules: Delivery cost rules based on the total value of the products in the basket.
- Offer Rules: Offers or discounts applied to specific products in the basket.
- Basket: A shopping cart that holds the items and calculates the total cost, including the effects of offers and delivery charges.


## Assumptions

- Products are uniquely identified by their codes.

- Offers apply only to specified product codes.

- Delivery charges are cumulative based on thresholds.

- Prices are fixed for the given products.


## Run Locally

Clone the project

```bash
  git clone https://github.com/abdull-raheem/acme_widget_co_sales_system.git
```

Go to the project directory

```bash
  cd acme_widget_co_sales_system
```

Install dependencies

```bash
  rvm install ruby-2.7.8
```

Run the program

```bash
  ruby main.rb
```

