# GET deck/:id
#   find the deck with :id
#   find the cards associated with the deck

#   pull a random card
#   IF card guess is true
#     redirect to GET deck/:id
#   END
  
#   render to game home
# END

# GAME view
#   display card
#   post user answer with card/:id and deck/:id
# END

# POST deck/:id/card/:id
#   pass user answer to a variable
#   IF user answer equals card answer
#     display congratulatory message
#     save user response as true for card/:id
#   ELSE
#     display error message with correct answer
#     save user response as false for card/:id
#   END

#   render to GET deck/:id

# END
