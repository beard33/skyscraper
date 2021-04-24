## Skyscraper
Skyscraper is a [simple game](https://www.brainbashers.com/skyscrapershelp.asp) where, given a squared grid with some constraints, you have to fill it with integers according to the following rules:
- Each row and each column must have all numbers from 1 to `size of(column/row)`
- Each row and each column must contain a number only once
- Numbers on the edge tell you how many skyscrapers you can see (i.e. how many times the maximum changes along the row or column)

### Example
So, for example, given the following grid

```
0 2 2 1 0
3 X X X 1
1 X X X 2
2 X X X 2
0 2 1 3 0
```
The solution will be
```
0 2 2 1 0
3 1 2 3 1
1 3 1 2 2
2 2 3 1 2
0 2 1 3 0
```

### The validator
This simple haskell program takes in input (selected in the main code) a text file with a grid that represents a complete solution (i.e. edge constraints + solution) 
for a skyscraper problem and gives as output if the provided file respects all the constraints <br> <br>
0 is ignored, so if used on edge means that along that direction no check will be done on maximum changes, but only on correctness of the row values<br>
So as an example

```
0 2 2 1 0
3 1 2 3 1
1 3 1 2 0
0 2 3 1 2
0 2 1 3 0
```
Will print `Solution is correct`
whereas 
```
0 2 2 1 0
1 1 2 3 1
1 3 1 2 2
2 3 3 1 2
0 2 1 3 0
``` 
will print `Solution is incorrect` due to different constraints violations
