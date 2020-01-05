## Tic Tac Toe

To start a new game:
```
> ttt = TicTacToe.new
```
The board positions are numbered as below:
```
Position Locations:

 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9
```
To place a move on the board enter (for example to place an X in position 5):
```
> ttt.move("X", 5)
```
This will result in the board updating as shown below:
```
   |   |   
---+---+---
   | X |   
---+---+---
   |   |   
```
Continue taking turns as 'X' or 'O' until the game is finished.
