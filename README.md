# five_thirty_eight-weekly-riddler-solutions
These are scripts I've written in an effort to answer weekly Five Thirty Eight puzzles that require more than back-of-the-envelope calculation:

scotus.m - I wrote this script for the puzzle on 4/14/17 https://fivethirtyeight.com/features/how-many-bingo-cards-are-there-in-the-world/. The puzzle went as follows:

  Imagine that U.S. Supreme Court nominees are only confirmed if the same party holds the presidency and the Senate. What is 
  the expected number of vacancies on the bench in the long run?

  You can assume the following:

        -You start with an empty, nine-person bench.
        -There are two parties, and each has a 50 percent chance of winning the presidency and a 50 percent chance of winning 
         the Senate in each election.
        -The outcomes of Senate elections and presidential elections are independent.
        -The length of time for which a justice serves is uniformly distributed between zero and 40 years.
  
I implemented the rules above using my scotus.m script. To determine the average number of vacancies, I ran my model multiple
times at 1,000,000 years and determined the average number of judged on my model's SCOTUS to be about 7.8 (or an expected 
vacancy of 1.2). The final graph is meaningless (too many data points on a small graph) but I include it as a quick way of 
determining the mean via Tools->Data Statistics. 
______________________________________________________________________________________________________________________________

scotus2.m - this script is a modified version of scotus.m in which, for a slightly more realistic model, the senate is divided 
into three classes and each class comes up for reelection every six years with each class' election separated by two year 
intervals. The chances remain 50-50 for each class, and, as expected, whichever party controls at least two of the three 
classes is the senate majority.
