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
    diagonal1 = [0, 4, 8]
    diagonal2 = [2, 4, 6]
    diag_win1 = diagonal1.each{|i| diag_win1 << board[i]}
    diag_win1 = diagonal2.each{|i| diag_win2 << board[i]}
    if full?(board) && won?(board) == false
        true
    elsif
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
board = ["X", "O", "O", "X", "X", "X", "X", "X", "X"]
won?(board)
