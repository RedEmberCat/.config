def calc_paint_amount(width, height):

  square_feet = width * height
  # Write your code below!
  def calc_gallons():
      return square_feet / 400

  return calc_gallons()


print('Number of paint gallons needed: ')
print(str(calc_paint_amount(30,20)))
