# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)

    if board.all?{|i| i == " "}
        return false
    end

    WIN_COMBINATIONS.each do |condi|
        winning_combi = []
        condi.each do |i|
            winning_combi << board[i]
        end
        if winning_combi.all?{|i| i == "X"}
            return condi
            break
        elsif winning_combi.all?{|i| i == "O"}
            return condi
            break
        elsif winning_combi.all?{|i| i != "X" || i != "O"} && full?(board)
            return false
        end
    end
end

def full?(board)
    if board.all?{|i| i == "X" || i == "O"}
        true
    else
        false
    end

end

def draw?(board)
    if diagonal_win?(board)
        false
    elsif full?(board) && won?(board) == false
        true
    end
end

def diagonal_win?(board)
    diagonal1 = [0, 4, 8]
    diagonal2 = [2, 4, 6]
    diag_win1 = []
    diag_win2 = []
    diagonal1.each{|i| diag_win1 << board[i]}
    diagonal2.each{|i| diag_win2 << board[i]}

    if diag_win1.all?{|i| i == "X"} || diag_win1.all?{|i| i == "O"}
        true
    elsif diag_win2.all?{|i| i == "X"} || diag_win2.all?{|i| i == "O"}
        true
    else
        false
    end
end

def over?(board)
    if draw?(board)
        true
    elsif won?(board) && full?(board)
        true
    elsif won?(board)
        true
    elsif full?(board) == false && won?(board) == false
        false
    end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]
board = ["X", "X", "X", "O", "X", "O", "X", "O", "O"]
print won?(board)
