# compute quotient, 
# using only additon subtraction


def divide(dividend, divisor)

  denom = divisor
  current = 0

  return 0 if denom > dividend
  return 1 if denom == dividend

         # 5       45
  while denom <= dividend do 
  	denom += divisor
  	current += 1 
  end
  remainder = dividend - (denom - divisor)
  current
end