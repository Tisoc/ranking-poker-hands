  # ALVARO MARQUEZ 20/08/18 RANKING POKER HANDS 
  
  # TO RUN IT GO TO LINE OF CODE , WRITE THE TWO HANDS AND RUN IT ON THE TERMINAL
  
  # Method to determine the highest hand in cases 1 and 5 of a tie
  def highest_straight(temp, array1, array2)
    weakace1 = false
    weakace2 = false
    
    if array1[0] == 1
      weakace1 = check_ace(array1)
    elsif array2[0] == 1
      weakace2 = check_ace(array2)
    end
    
    if weakace1 && weakce2
      return 3
    elsif weakace1
      return 2
    elsif weakace2
      return 1
    end
    
    return highest_card(temp,array1,array2)
  end
  
  # Method to determine the highest hand in cases 2, 3 and 6 and 8 of a tie
  def highest_number(temp, array1, array2)
    i = 0
    if temp == 2 # For four of a kind cases
      for elements in array1
        if array1[i] == 4 && array1[i] > array2[i]
          return 1
        elsif array2[i] == 4 && array1[i] < array2[i]
          return 2
        else
          i += 1
        end
      end
    elsif temp == 3 || temp == 6 #Three of a kind cases
      for elements in array1
        if array1[i] == 3 && array1[i] > array2[i]
          return 1
        elsif array2[i] == 3 && array1[i] < array2[i]
          return 2
        else
          i += 1
        end
      end
    else #Pair cases
      for elements in array1
        if array1[i] == 2 && array1[i] > array2[i]
          return 1
        elsif array2[i] == 2 && array1[i] < array2[i]
          return 2
        else
          i += 1
        end
      end
      i = 0
      for elements in array1
        if array1[i] == 1 && array1[i] > array2[i]
          return 1
        elsif array2[i] == 1 && array1[i] < array2[i]
          return 2
        else
          i += 1
        end
      end
    end
  end 
  
  # Method to determine the highest hand in cases 4 and 9 of a tie
  def highest_card(temp, array1, array2)
    i = 0
      for elements in array1
        if array1[i] > array2[i]
          return 1
        elsif array1[i] < array2[i]
          return 2
        else
          i += 1
        end
      end
  end
  
  # Method that determines who is the winner in case of a tie
  def tiemanager(temp, array1, array2)
    if temp == 0
      return 3
    elsif temp == 1 || temp == 5
      return highest_straight(temp, array1, array2) 
    elsif temp == 2 || temp == 3 || temp == 6 || temp == 7 || temp == 8
      return highest_number(temp, array1, array2)
    elsif temp == 4 || temp == 9
      return highest_card(temp, array1, array2)
    end
  end
  
  # Method to check if it's a Flush
  # A flush is any five cards of the same symbol, but they are not in a sequence
  def check_flush(hand_copy)
    aux = hand_copy[0][1]
    i = 1
    while i < 5 do
      if hand_copy[i][1] != aux
        return false
      else
        i += 1
      end
    end
     return true
  end
  
  # Method to check if the Ace is the weak card
  def check_ace(array) 
    i = 9
    k = 0
    while k < 4 do
      if array[i] != 1
        return false
      else
        k += 1
        i += 1
      end
    end
    return true
  end
  
  # Method that checks the array of wins
  def check_wins(array1,array2)
    k = 0
    for element in array1
      if array1[k] > array2[k]
        return true
      elsif array1[k] < array2[k]
        return false
      elsif array1[k] == 1 && array2[k] == 1
        return k
      else
        k += 1
      end
    end
  end
  
  # Method to check if it's a Royal Flush
  # A, K, Q, J, 10, all of the same symbol
  def check_royal(array, hand_copy)
    #Check if the numbers are in sequence using the array of counter
    i = 0
    while i < 5 do
      if array[i] != 1
        return false
      else 
        i += 1
      end
    end
    if check_flush(hand_copy)
      return true
    end
  end
  
  # Method to check if it's a Straight Flush
  # Five cards in a sequence and they have the same symbol
  def check_sflush(array, hand_copy)
    i = 0
    while array[i] != 1 do
      if array[i] > 1 
        return false
      end
      i += 1
    end
    
    k = 0
    while k < 4 do
      if array[i+1] != 1 || !(check_flush(hand_copy))
        return false
      else
        k += 1
        i += 1
      end
    end
    
    if array[0] == 1
      if check_ace(array)
        return true
      end
    end
    return true
  end
  
  # Method to check if it's a Four of a Kind
  # All four cards of the same rank
  def fourof(array,hand_copy)
    i = 0
    for elements in array
      if array[i] == 4
        return true
      end
      i += 1
    end
    return false
  end
  
  # Method to check if it's a Full House
  # Three of a kind with a pair
  def fullhouse(array)
    i = 0
    t = false
    pa = false
    
    # Check if it has 3 of a kind and a pair
    for elements in array
      if array[i] == 3
        t = true
        i += 1
      elsif array[i] == 2
        pa = true
        i += 1
      else
        i += 1
      end
    end
    
    #If it has both then it's a Full House
    if t && pa
      return true
    else
      return false
    end
  end
  
  # Method to check if it's a Normal Straight
  # Five cards in a sequence, but not with the same symbol
  def check_straight(array)
    i = 0
    while array[i] != 1 do
      if array[i] > 1 
        return false
      end
      i += 1
    end
    
    k = 0
    while k < 4 do
      if array[i+1] != 1
        return false
      else
        k += 1
        i += 1
      end
    end
    
    if array[0] == 1
      if check_ace(array)
        return true
      end
    end
    return true
  end
  
  # Method to check if it has Three of a Kind
  # Three cards of the same rank
  def threeofkind(array)
    i = 0
    #Check if it has 3 of a kind
    for elements in array
      if array[i] == 3
        return true
      else
        i += 1
      end
    end
    return false
  end
  
  # Method to check if the hand has 2 pairs
  # Two different pairs
  def twopairs(array)
    
    i = 0
    icount = 0;
    for elements in array
      if array[i] == 2
        icount += 1
        i += 1
      else
        i += 1
      end
    end
    
    if icount == 2
      return true
    else
      return false
    end
  end
  
  # Method to check if the hand has a single pair
  # Two cards of the same rank
  def pair(array)
    i = 0
    for elements in array
      if array[i] == 2
        return true
      else
        i += 1
      end
    end
    return false
  end
  
  #Method that counts how many times a card repeats and saves it into an array
  def count_repeats(hand_copy, array)
    icounter2 = 0
    for element in hand_copy
      if hand_copy[icounter2][0] == "A"
        array[0] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "2"
        array[12] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "3"
        array[11] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "4"
        array[10] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "5"
        array[9] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "6"
        array[8] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "7"
        array[7] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "8"
        array[6] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "9"
        array[5] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "10"
        array[4] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "J"
        array[3] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "Q"
        array[2] += 1
        icounter2 += 1
      elsif hand_copy[icounter2][0] == "K"
        array[1] += 1
        icounter2 += 1
      else  
        puts "Invalid card"
        break
      end
    end
      return array
  end

  #Method that receives both hands, calls the corresponding methods and returns the winner
  def rank_hands(hand_1,hand_2)
  
    #GETTING THE RANK OF HAND_1
  
    #Cloning the array to manipulate it
    hand1_copy = hand_1.clone
  
    #Splitting the array to have number and symbol separated
    icounter = 0
    for element in hand1_copy
      hand1_copy[icounter] = hand1_copy[icounter].split('')
      icounter += 1
    end
  
    #Rejoining number 10 as it splits to '1' and '0'
    rej1 = 0
    for element in hand1_copy
      if hand1_copy[rej1][0] == "1"
        hand1_copy[rej1][0] = "10"
        hand1_copy[rej1][1] = hand1_copy[rej1][2]
        hand1_copy[rej1].pop
      end
      rej1 += 1
    end
  
    #Array of counters to see which card repeats the most(It goes from strongest card to weakest)
    arrcounts1 = [0,0,0,0,0,0,0,0,0,0,0,0,0] # from "A" to "2"
    arrcounts1 = count_repeats(hand1_copy,arrcounts1)
    
    #Array that stores a counter depending on the type of hand(Stores from Best Hand to Worst)
    hand1_win = [0,0,0,0,0,0,0,0,0,0] 
    # [0] = Royal Flush  [1] = Straight Flush  [2] = Four of the Same Kind [3] = Full House
    # [4] = Flush  [5] = Straight  [6] = Three of a Kind  [7] = Two Pairs
    # [8] = Pair  [9] = High Card
  
    #Analyze the Hand for Each Case to Find the One it Belongs to (Goes from Strongest to Weakest)
    if check_royal(arrcounts1, hand1_copy) #Check for Royal Flush
      hand1_win[0] = 1;
    elsif check_sflush(arrcounts1, hand1_copy) #Check for Straight Flush
      hand1_win[1] = 1;
    elsif fourof(arrcounts1, hand1_copy) #Check for Four of a Kind
      hand1_win[2] = 1;
    elsif fullhouse(arrcounts1) #Check for Full House
      hand1_win[3] = 1;
    elsif check_flush(hand1_copy) #Check for Flush
      hand1_win[4] = 1;
    elsif check_straight(arrcounts1) #Check for Straight
      hand1_win[5] = 1;
    elsif threeofkind(arrcounts1) #Check for Three of a Kind
      hand1_win[6] = 1;
    elsif twopairs(arrcounts1) #Check for Two Pairs
      hand1_win[7] = 1;
    elsif pair(arrcounts1) #Check for a Single Pair
      hand1_win[8] = 1;
    else #Check for High Card
      hand1_win[9] = 1;
    end
  
    #GETTING THE RANK OF HAND_2
  
    #Cloning the array to manipulate it
    hand2_copy = hand_2.clone

    #Splitting the array to have number and symbol separated
    icounter2 = 0
    for element in hand2_copy
      hand2_copy[icounter2] = hand2_copy[icounter2].split('')
      icounter2 += 1
    end
  
    #Rejoining number 10 as it splits to '1' and '0'
    j = 0
    for element in hand2_copy
      if hand2_copy[j][0] == "1"
        hand2_copy[j][0] = "10"
        hand2_copy[j][1] = hand2_copy[j][2]
        hand2_copy[j].pop
      end
      j += 1
    end
  
    #Array of counters to see which card repeats the most(It goes from strongest card to weakest)
    arrcounts2 = [0,0,0,0,0,0,0,0,0,0,0,0,0]
    arrcounts2 = count_repeats(hand2_copy,arrcounts2)
    
    #Array that stores a counter depending on the type of hand (Stores from Best Hand to Worst)
    hand2_win = [0,0,0,0,0,0,0,0,0,0] 
    # [0] = Royal Flush  [1] = Straight Flush  [2] = Four of the Same Kind [3] = Full House
    # [4] = Flush  [5] = Straight  [6] = Three of a Kind  [7] = Two Pairs
    # [8] = Pair  [9] = High Card
  
    #Analyze the Hand for Each Case to Find the One it Belongs to
    if check_royal(arrcounts2, hand2_copy) #Check for Royal Flush
      hand2_win[0] = 1;
    elsif check_sflush(arrcounts2, hand2_copy) #Check for Straight Flush
      hand2_win[1] = 1;
    elsif fourof(arrcounts2, hand2_copy) #Check for Four of a Kind
      hand2_win[2] = 1;
    elsif fullhouse(arrcounts2) #Check for Full House
      hand2_win[3] = 1;
    elsif check_flush(hand2_copy) #Check for Flush
      hand2_win[4] = 1;
    elsif check_straight(arrcounts2) #Check for Straight
      hand2_win[5] = 1;
    elsif threeofkind(arrcounts2) #Check for Three of a Kind
      hand2_win[6] = 1;
    elsif twopairs(arrcounts2) #Check for Two Pairs
      hand2_win[7] = 1;
    elsif pair(arrcounts2) #Check for One Pair
      hand2_win[8] = 1;
    else
      hand2_win[9] = 1; #Check for High Card
    end
  
    #Comparing the Hands to See Which Wins Calling the check_wins Method
    if check_wins(hand1_win,hand2_win) == true
      return hand_1
    elsif check_wins(hand1_win,hand2_win) == false
      return hand_2
    else #If both hands are of the same type, the tiemanager method is called
      temp = check_wins(hand1_win,hand2_win)
      if tiemanager(temp,arrcounts1,arrcounts2) == 1
        return hand_1
      elsif tiemanager(temp,arrcounts1,arrcounts2) == 2
        return hand_2
      else
        return "It's a Tie!" #Only occurs if both hands are Royal Flush
      end
    end
  end

  #Initializing the Hands
  hand_1 = %w(2S 2D AH 3S 5S)
  hand_2 = %w(2H 2C KH 5H 9C)

  #Calling the rank_hands method
  winner = rank_hands(hand_1,hand_2)
  puts winner.inspect

