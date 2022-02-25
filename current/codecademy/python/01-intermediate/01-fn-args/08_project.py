from nile import get_distance, format_price, SHIPPING_PRICES
from test import test_function

def calculate_shipping_cost(from_coords, to_coords, shipping_type='Overnight'):
    distance = get_distance(*from_coords, *to_coords)
    shipping_rate = SHIPPING_PRICES[shipping_type]
    price = distance * shipping_rate
    return format_price(price)

def calculate_driver_cost(distance, *drivers):
    prices_drivers = ((driver.salary * driver.speed * distance, driver)
            for driver in drivers)
    return sorted(prices_drivers)[0]

def calculate_money_made(**trips):
    return sum(trip.cost - trip.driver.cost for trip in trips.values())

test_function(calculate_shipping_cost)
test_function(calculate_driver_cost)
test_function(calculate_money_made)
