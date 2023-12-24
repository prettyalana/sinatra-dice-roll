require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


# get("/homepage") do
#   "<h1>Dice Roll<h1>
#   <ul>
#   <li><a href=/dice/2/6>Roll two 6-sided dice</a></li>
#   <li><a href=/dice/2/10>Roll two 10-sided dice</a></li>
#   <li><a href=/dice/1/20>Roll one 20-sided dice</a></li>
#   <li><a href=/dice/5/4>Roll five 4-sided dice</a></li>
#   </ul>
#   "
# end


# get("/") do
#   "Hello World"
# end


# get("/") do
#   "
#   <h1>Dice Roll<h1>

#    <ul>
#    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
#    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
#    <li><a href=\"/dice/1/20\">Roll one 20-sided dice</a></li>
#    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
#    </ul>
#    "

# end

get("/") do
  erb(:homepage)
end

get("/zebra") do
  lucky_num = rand(100)
  return "Your lucky number for today is #{lucky_num}"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end

get("/dice/2/6") do
  @rolls = []
  
  1.times do
    first_num = rand(1..6)
    second_num = rand(1..6)

    @rolls.push(first_num, second_num)

    sum = first_num + second_num 
    @outcome = "You rolled a #{first_num} and a #{second_num} for a total of #{sum}."
  end

  # first_num = rand(1..6)
  # second_num = rand(1..6)
  # sum = first_num + second_num 
  # @outcome = "You rolled a #{first_num} and a #{second_num} for a total of #{sum}."

# "<h1>2d6<h1>
# <h4>Two 6-sided Dice<h4>
# <p>#{outcome}</p>"
erb(:two_six)
end


get("/dice/2/10") do

  @rolls = []

  1.times do 
    first_dice = rand(1..10)
    second_dice = rand(1..10)
    sum = first_dice + second_dice
    @outcome = "You rolled a #{first_dice} and a #{second_dice} for a total of #{sum}."


    @rolls.push(first_dice, second_dice)
  end


  # first_dice = rand(1..10)
  # second_dice = rand(1..10)
  # sum = first_dice + second_dice
  # @outcome = "You rolled a #{first_dice} and a #{second_dice} for a total of #{sum}."

  # "<h1>2d10<h1>
  # <h4>Two 10-sided Dice<h4>
  # <p>#{outcome}</p>
  # "
  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = []

  1.times do
    @dice_num = rand(1..20)
    @outcome = "You rolled a #{@dice_num}"

    @rolls.push(@dice_num)
  end

# @dice_num = rand(1..20)
# @outcome = "You rolled a #{@dice_num}"

# "<h1>1d20<h1>
# <h4>One 20-sided Dice<h4>
# <p>#{outcome}</p>
# "
erb(:one_twenty)
end

get("/dice/5/4") do

  @rolls = []

  1.times do 
    dice_one = rand(1..4)
    dice_two = rand(1..4)
    dice_three = rand(1..4)
    dice_four = rand(1..4)
    dice_five = rand(1..4)
    sum = dice_one + dice_two + dice_three + dice_four + dice_five
    @outcome = "You rolled #{dice_one}, #{dice_two}, #{dice_three}, #{dice_four}, and #{dice_five} for a sum of #{sum}."

    @rolls.push(dice_one, dice_two, dice_three, dice_four, dice_five)
  end
# dice_one = rand(1..4)
# dice_two = rand(1..4)
# dice_three = rand(1..4)
# dice_four = rand(1..4)
# dice_five = rand(1..4)
# sum = dice_one + dice_two + dice_three + dice_four + dice_five
# @outcome = "You rolled #{dice_one}, #{dice_two}, #{dice_three}, #{dice_four}, and #{dice_five} for a sum of #{sum}."

# "<h1>5d4<h1>
# <h4>Five 4-sided Dice<h4>
# <p>#{outcome}<p>
# "
erb(:five_four)
end

# get("/dice/100/6") do
# @rolls = []

# 100.times do
#   die = rand(1..6)

#   @rolls.push(die)
# end


#   erb(:one_hundred_six)
# end
