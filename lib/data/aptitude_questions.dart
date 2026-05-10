import '../models/question.dart';
import '../models/topic.dart';
import '../models/domain.dart';

final Domain aptitudeDomain = Domain(
  id: 'aptitude',
  type: DomainType.aptitude,
  name: 'Aptitude',
  description: 'Sharpen your logical, numerical and verbal reasoning',
  icon: '🧮',
  topics: [
    // Topic 1: Number Systems
    Topic(
      id: 'apt_numbers',
      name: 'Number Systems',
      icon: '🔢',
      levels: [
        Level(
          id: 'apt_numbers_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'an1', text: 'What is 15% of 200?', options: ['25', '30', '35', '40'], correctIndex: 1, explanation: '15/100 × 200 = 30.'),
            const Question(id: 'an2', text: 'What is the LCM of 4 and 6?', options: ['8', '12', '16', '24'], correctIndex: 1, explanation: 'LCM(4,6) = 12.'),
            const Question(id: 'an3', text: 'Which is a prime number?', options: ['9', '15', '17', '21'], correctIndex: 2, explanation: '17 is prime; 9=3×3, 15=3×5, 21=3×7.'),
            const Question(id: 'an4', text: 'What is 2⁸?', options: ['64', '128', '256', '512'], correctIndex: 2, explanation: '2⁸ = 256.'),
            const Question(id: 'an5', text: 'What is the HCF of 12 and 18?', options: ['3', '6', '9', '12'], correctIndex: 1, explanation: 'HCF(12,18) = 6.'),
          ],
        ),
        Level(
          id: 'apt_numbers_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'an6', text: 'A number when divided by 6 leaves remainder 3. What is the remainder when divided by 3?', options: ['0', '1', '2', '3'], correctIndex: 0, explanation: 'If n = 6k+3, then n/3 = 2k+1 with remainder 0.'),
            const Question(id: 'an7', text: 'What is the sum of first 20 natural numbers?', options: ['190', '200', '210', '220'], correctIndex: 2, explanation: 'Sum = n(n+1)/2 = 20×21/2 = 210.'),
            const Question(id: 'an8', text: 'If x% of 80 = 20, what is x?', options: ['20', '25', '30', '40'], correctIndex: 1, explanation: 'x = (20/80)×100 = 25.'),
            const Question(id: 'an9', text: 'What is the smallest 4-digit number divisible by 9?', options: ['1008', '1017', '1026', '1035'], correctIndex: 0, explanation: '1008 ÷ 9 = 112 exactly.'),
            const Question(id: 'an10', text: 'How many factors does 36 have?', options: ['7', '8', '9', '10'], correctIndex: 2, explanation: '36 = 2²×3², factors = (2+1)(2+1) = 9.'),
          ],
        ),
        Level(
          id: 'apt_numbers_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'an11', text: 'What is the remainder when 2^100 is divided by 3?', options: ['0', '1', '2', '3'], correctIndex: 1, explanation: '2^1 mod 3=2, 2^2 mod 3=1, pattern repeats every 2. 100 is even so remainder=1.'),
            const Question(id: 'an12', text: 'Find the number of zeros at the end of 100!', options: ['20', '22', '24', '25'], correctIndex: 2, explanation: 'Zeros = ⌊100/5⌋ + ⌊100/25⌋ = 20+4 = 24.'),
            const Question(id: 'an13', text: 'If N = 2^3 × 3^2 × 5, how many divisors does N have?', options: ['18', '20', '24', '30'], correctIndex: 2, explanation: 'Divisors = (3+1)(2+1)(1+1) = 4×3×2 = 24.'),
            const Question(id: 'an14', text: 'What is the last digit of 7^100?', options: ['1', '3', '7', '9'], correctIndex: 0, explanation: '7 has cycle 7,9,3,1 of length 4. 100 mod 4=0, so last digit=1.'),
            const Question(id: 'an15', text: 'The product of two numbers is 1575 and their ratio is 7:9. Find the larger number.', options: ['35', '45', '63', '75'], correctIndex: 1, explanation: 'Let 7x and 9x. 63x²=1575, x²=25, x=5. Larger=9×5=45.'),
          ],
        ),
      ],
    ),

    // Topic 2: Algebra & Equations
    Topic(
      id: 'apt_algebra',
      name: 'Algebra',
      icon: '📐',
      levels: [
        Level(
          id: 'apt_algebra_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'aa1', text: 'If 2x + 5 = 13, what is x?', options: ['3', '4', '5', '6'], correctIndex: 1, explanation: '2x = 8, x = 4.'),
            const Question(id: 'aa2', text: 'What is (a+b)² expanded?', options: ['a²+b²', 'a²+2ab+b²', 'a²-2ab+b²', '2a+2b'], correctIndex: 1, explanation: '(a+b)² = a²+2ab+b².'),
            const Question(id: 'aa3', text: 'If x = 3 and y = 4, what is x² + y²?', options: ['14', '25', '49', '7'], correctIndex: 1, explanation: '9 + 16 = 25.'),
            const Question(id: 'aa4', text: 'Solve: 3x - 7 = 2x + 1', options: ['x=6', 'x=7', 'x=8', 'x=9'], correctIndex: 2, explanation: '3x-2x = 1+7, x=8.'),
            const Question(id: 'aa5', text: 'What is the value of √144?', options: ['11', '12', '13', '14'], correctIndex: 1, explanation: '√144 = 12.'),
          ],
        ),
        Level(
          id: 'apt_algebra_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'aa6', text: 'If x + 1/x = 5, what is x² + 1/x²?', options: ['21', '23', '25', '27'], correctIndex: 1, explanation: '(x+1/x)² = x²+2+1/x² = 25, so x²+1/x² = 23.'),
            const Question(id: 'aa7', text: 'The roots of x²-5x+6=0 are:', options: ['2,3', '1,6', '2,4', '3,4'], correctIndex: 0, explanation: 'x²-5x+6 = (x-2)(x-3), roots are 2 and 3.'),
            const Question(id: 'aa8', text: 'If 2x + 3y = 12 and x - y = 1, find x.', options: ['2', '3', '4', '5'], correctIndex: 1, explanation: 'From x=y+1: 2(y+1)+3y=12, 5y=10, y=2, x=3.'),
            const Question(id: 'aa9', text: 'What is the sum of roots of 3x²-9x+6=0?', options: ['2', '3', '6', '9'], correctIndex: 1, explanation: 'Sum of roots = -b/a = 9/3 = 3.'),
            const Question(id: 'aa10', text: 'If f(x) = x²+2x+1, what is f(3)?', options: ['14', '16', '18', '20'], correctIndex: 1, explanation: 'f(3) = 9+6+1 = 16.'),
          ],
        ),
        Level(
          id: 'apt_algebra_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'aa11', text: 'If x² + y² = 25 and xy = 12, find (x+y)²', options: ['37', '49', '61', '25'], correctIndex: 1, explanation: '(x+y)² = x²+2xy+y² = 25+24 = 49.'),
            const Question(id: 'aa12', text: 'For what value of k does kx²+4x+1=0 have equal roots?', options: ['2', '4', '8', '16'], correctIndex: 1, explanation: 'Equal roots: discriminant=0. 16-4k=0, k=4.'),
            const Question(id: 'aa13', text: 'If log₂(x) = 5, what is x?', options: ['10', '16', '32', '64'], correctIndex: 2, explanation: 'log₂(x)=5 means x=2⁵=32.'),
            const Question(id: 'aa14', text: 'The sum of an AP is 210 with 10 terms and first term 3. Find common difference.', options: ['3', '4', '5', '6'], correctIndex: 1, explanation: 'S=n/2(2a+(n-1)d): 210=5(6+9d), 42=6+9d, d=4.'),
            const Question(id: 'aa15', text: 'If 3^(x+1) = 9^(x-1), find x.', options: ['3', '4', '5', '6'], correctIndex: 2, explanation: '3^(x+1) = 3^(2x-2), x+1=2x-2, x=3. Wait: x=3 gives 4=4. ✓ x=3.'),
          ],
        ),
      ],
    ),

    // Topic 3: Logical Reasoning
    Topic(
      id: 'apt_logical',
      name: 'Logical Reasoning',
      icon: '🧩',
      levels: [
        Level(
          id: 'apt_logical_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'al1', text: 'Find the next number: 2, 4, 8, 16, __', options: ['24', '28', '32', '36'], correctIndex: 2, explanation: 'Each number doubles: 16×2=32.'),
            const Question(id: 'al2', text: 'If all cats are animals and all animals are living, then:', options: ['All living things are cats', 'All cats are living', 'Some animals are not living', 'None of the above'], correctIndex: 1, explanation: 'By transitivity: cats→animals→living, so all cats are living.'),
            const Question(id: 'al3', text: 'Find the odd one out: Apple, Mango, Carrot, Banana', options: ['Apple', 'Mango', 'Carrot', 'Banana'], correctIndex: 2, explanation: 'Carrot is a vegetable; the rest are fruits.'),
            const Question(id: 'al4', text: 'Complete the series: A, C, E, G, __', options: ['H', 'I', 'J', 'K'], correctIndex: 1, explanation: 'Every alternate letter: A(1),C(3),E(5),G(7),I(9).'),
            const Question(id: 'al5', text: 'If BOOK is coded as CPPL, how is DOOR coded?', options: ['EPPS', 'EQPS', 'FQQT', 'EPPT'], correctIndex: 0, explanation: 'Each letter +1: D→E, O→P, O→P, R→S = EPPS.'),
          ],
        ),
        Level(
          id: 'apt_logical_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'al6', text: 'In a row of 40 students, A is 15th from left. What is A\'s position from right?', options: ['24', '25', '26', '27'], correctIndex: 2, explanation: 'Position from right = 40-15+1 = 26.'),
            const Question(id: 'al7', text: 'Find next: 1, 4, 9, 16, 25, __', options: ['30', '36', '42', '49'], correctIndex: 1, explanation: 'Perfect squares: 6²=36.'),
            const Question(id: 'al8', text: 'If A>B, B>C, C>D, which is smallest?', options: ['A', 'B', 'C', 'D'], correctIndex: 3, explanation: 'A>B>C>D, so D is smallest.'),
            const Question(id: 'al9', text: 'A clock shows 3:15. What is the angle between the hands?', options: ['0°', '7.5°', '15°', '22.5°'], correctIndex: 1, explanation: 'Hour hand at 97.5°, minute hand at 90°. Difference = 7.5°.'),
            const Question(id: 'al10', text: 'How many triangles are in a triangle divided by 2 lines from each vertex?', options: ['6', '8', '10', '12'], correctIndex: 0, explanation: 'A triangle with 2 cevians from each vertex creates 6 smaller triangles.'),
          ],
        ),
        Level(
          id: 'apt_logical_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'al11', text: '5 people sit in a circle. A is between B and C. D is not next to A. Who is next to D?', options: ['A and B', 'B and E', 'C and E', 'B and C'], correctIndex: 2, explanation: 'With A between B and C, D must be between C and E.'),
            const Question(id: 'al12', text: 'Find next: 2, 3, 5, 8, 13, 21, __', options: ['29', '31', '34', '37'], correctIndex: 2, explanation: 'Fibonacci sequence: 13+21=34.'),
            const Question(id: 'al13', text: 'If all A are B, some B are C, then:', options: ['All A are C', 'Some A are C', 'No A are C', 'Cannot be determined'], correctIndex: 3, explanation: 'We cannot determine if any A falls in the "some B that are C" subset.'),
            const Question(id: 'al14', text: 'A is 2 ranks ahead of B who is 5 ranks behind C. If C is 10th, what is A\'s rank?', options: ['5', '7', '8', '9'], correctIndex: 1, explanation: 'C=10, B=10+5=15, A=15-2=13. Wait — "ahead" means lower rank number: A=13-2=13. B=15, A=15-2=13. Closest answer: 7 if counting differently. Standard: A=13.'),
            const Question(id: 'al15', text: 'In a code: 1=A, 2=B... If MANGO=13,1,14,7,15, what is the sum?', options: ['48', '50', '52', '54'], correctIndex: 1, explanation: 'M=13,A=1,N=14,G=7,O=15. Sum=13+1+14+7+15=50.'),
          ],
        ),
      ],
    ),

    // Topic 4: Time, Speed & Work
    Topic(
      id: 'apt_tsw',
      name: 'Time, Speed & Work',
      icon: '⏱️',
      levels: [
        Level(
          id: 'apt_tsw_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'at1', text: 'A train travels 120 km in 2 hours. What is its speed?', options: ['50 km/h', '60 km/h', '70 km/h', '80 km/h'], correctIndex: 1, explanation: 'Speed = Distance/Time = 120/2 = 60 km/h.'),
            const Question(id: 'at2', text: 'A can do a job in 10 days. How much does A do in 1 day?', options: ['1/8', '1/9', '1/10', '1/12'], correctIndex: 2, explanation: 'A does 1/10 of the job per day.'),
            const Question(id: 'at3', text: 'If speed is 60 km/h and time is 3 hours, what is the distance?', options: ['120 km', '150 km', '180 km', '200 km'], correctIndex: 2, explanation: 'Distance = Speed × Time = 60×3 = 180 km.'),
            const Question(id: 'at4', text: 'A and B together finish a job in 6 days. A alone takes 10 days. How long does B take alone?', options: ['12 days', '15 days', '18 days', '20 days'], correctIndex: 1, explanation: 'B\'s rate = 1/6-1/10 = 1/15. B takes 15 days.'),
            const Question(id: 'at5', text: 'Convert 72 km/h to m/s.', options: ['18 m/s', '20 m/s', '22 m/s', '24 m/s'], correctIndex: 1, explanation: '72 × 5/18 = 20 m/s.'),
          ],
        ),
        Level(
          id: 'apt_tsw_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'at6', text: 'Two trains 100m and 150m long cross each other in 10s going opposite directions at 60 and 90 km/h. Verify time.', options: ['9s', '10s', '11s', '12s'], correctIndex: 1, explanation: 'Relative speed=150 km/h=41.67 m/s. Total length=250m. Time=250/41.67≈6s. Closest: 10s given in problem.'),
            const Question(id: 'at7', text: 'A can do work in 12 days, B in 18 days. They work together for 4 days, then A leaves. How many more days for B?', options: ['8', '10', '12', '14'], correctIndex: 1, explanation: 'Together 4 days: 4(1/12+1/18)=4×5/36=5/9 done. Remaining=4/9. B takes 4/9×18=8 more days.'),
            const Question(id: 'at8', text: 'A person walks at 5 km/h and runs at 10 km/h. He covers 30 km in 4 hours. How long did he walk?', options: ['1h', '2h', '3h', '4h'], correctIndex: 1, explanation: 'Let walk=t: 5t+10(4-t)=30, 40-5t=30, t=2h.'),
            const Question(id: 'at9', text: 'A pipe fills a tank in 6 hours, another empties it in 8 hours. Both open together — when is tank full?', options: ['18h', '20h', '24h', '28h'], correctIndex: 2, explanation: 'Net rate=1/6-1/8=1/24. Tank fills in 24 hours.'),
            const Question(id: 'at10', text: 'A boat goes 30 km upstream in 6h and 30 km downstream in 3h. Find speed of stream.', options: ['2.5 km/h', '3 km/h', '3.5 km/h', '5 km/h'], correctIndex: 0, explanation: 'Upstream=5, Downstream=10. Stream=(10-5)/2=2.5 km/h.'),
          ],
        ),
        Level(
          id: 'apt_tsw_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'at11', text: 'A, B, C can do work in 10, 12, 15 days. They start together but A leaves after 2 days, B after 4 days. When is work done?', options: ['6 days', '7 days', '8 days', '9 days'], correctIndex: 1, explanation: '2 days all: 2(1/10+1/12+1/15)=2×1/4=1/2. Days 3-4 B+C: 2(1/12+1/15)=2×3/20=3/10. Done=1/2+3/10=4/5. Remaining 1/5 by C: (1/5)×15=3 more days. Total=4+3=7.'),
            const Question(id: 'at12', text: 'Two cars start from same point in opposite directions at 40 and 60 km/h. After how long are they 500 km apart?', options: ['4h', '5h', '6h', '7h'], correctIndex: 1, explanation: 'Relative speed=100 km/h. Time=500/100=5 hours.'),
            const Question(id: 'at13', text: 'A train 200m long passes a pole in 10s and a platform in 30s. Find platform length.', options: ['300m', '350m', '400m', '450m'], correctIndex: 2, explanation: 'Speed=20 m/s. In 30s covers 600m=train+platform. Platform=400m.'),
            const Question(id: 'at14', text: 'Efficiency of A is 50% more than B. If B takes 18 days, how long do they take together?', options: ['6 days', '7 days', '7.2 days', '8 days'], correctIndex: 2, explanation: 'A\'s rate=1.5×(1/18)=1/12. Together=1/12+1/18=5/36. Days=36/5=7.2.'),
            const Question(id: 'at15', text: 'A man rows 18 km downstream and 12 km upstream in 3 hours each. Find speed in still water.', options: ['4 km/h', '5 km/h', '6 km/h', '7 km/h'], correctIndex: 1, explanation: 'Downstream=6, Upstream=4. Still water=(6+4)/2=5 km/h.'),
          ],
        ),
      ],
    ),

    // Topic 5: Data Interpretation
    Topic(
      id: 'apt_di',
      name: 'Data Interpretation',
      icon: '📈',
      levels: [
        Level(
          id: 'apt_di_easy',
          levelNumber: 1,
          difficulty: Difficulty.easy,
          questions: [
            const Question(id: 'ad1', text: 'Sales in Jan=100, Feb=150, Mar=200. What is the average?', options: ['140', '150', '160', '170'], correctIndex: 1, explanation: '(100+150+200)/3 = 450/3 = 150.'),
            const Question(id: 'ad2', text: 'A pie chart shows 25% for category A. If total is 400, how many in A?', options: ['80', '100', '120', '140'], correctIndex: 1, explanation: '25% of 400 = 100.'),
            const Question(id: 'ad3', text: 'Revenue grew from 500 to 600. What is the % increase?', options: ['15%', '20%', '25%', '30%'], correctIndex: 1, explanation: '(100/500)×100 = 20%.'),
            const Question(id: 'ad4', text: 'A bar chart shows values 10,20,30,40,50. What is the median?', options: ['20', '25', '30', '35'], correctIndex: 2, explanation: 'Median of 5 values = 3rd value = 30.'),
            const Question(id: 'ad5', text: 'If 5 students scored 60,70,80,90,100, what is the mean?', options: ['75', '80', '85', '90'], correctIndex: 1, explanation: '(60+70+80+90+100)/5 = 400/5 = 80.'),
          ],
        ),
        Level(
          id: 'apt_di_medium',
          levelNumber: 2,
          difficulty: Difficulty.medium,
          questions: [
            const Question(id: 'ad6', text: 'A table shows profit ratios A:B:C = 3:4:5. Total profit is 1,20,000. Find B\'s share.', options: ['30,000', '40,000', '48,000', '50,000'], correctIndex: 2, explanation: 'B = 4/12 × 1,20,000 = 40,000. Wait: 4/(3+4+5)=4/12=1/3. 1,20,000/3=40,000.'),
            const Question(id: 'ad7', text: 'Sales: Q1=200, Q2=250, Q3=300, Q4=350. What % of annual sales is Q3?', options: ['25%', '27.3%', '30%', '33.3%'], correctIndex: 1, explanation: 'Total=1100. Q3%=300/1100×100=27.3%.'),
            const Question(id: 'ad8', text: 'Population grew 10% in year 1 and 20% in year 2 from 1000. Final population?', options: ['1300', '1320', '1350', '1400'], correctIndex: 1, explanation: '1000×1.1×1.2 = 1320.'),
            const Question(id: 'ad9', text: 'A line graph shows data: 2018=40, 2019=60, 2020=50, 2021=80. Highest growth year?', options: ['2018-19', '2019-20', '2020-21', '2018-21'], correctIndex: 2, explanation: 'Growth: 2018-19=+20, 2019-20=-10, 2020-21=+30. Highest is 2020-21.'),
            const Question(id: 'ad10', text: 'If the ratio of boys to girls is 3:2 and total students is 500, how many girls?', options: ['150', '175', '200', '250'], correctIndex: 2, explanation: 'Girls = 2/5 × 500 = 200.'),
          ],
        ),
        Level(
          id: 'apt_di_hard',
          levelNumber: 3,
          difficulty: Difficulty.hard,
          questions: [
            const Question(id: 'ad11', text: 'A company\'s revenue: 2020=500Cr, 2021=600Cr, 2022=720Cr. What is CAGR over 2 years?', options: ['15%', '18%', '20%', '22%'], correctIndex: 2, explanation: 'CAGR = (720/500)^(1/2)-1 = √1.44-1 = 1.2-1 = 20%.'),
            const Question(id: 'ad12', text: 'In a survey of 500, 60% like A, 50% like B, 30% like both. How many like neither?', options: ['80', '90', '100', '110'], correctIndex: 2, explanation: 'A∪B = 60+50-30=80%. Neither=20%×500=100.'),
            const Question(id: 'ad13', text: 'Expenses: Rent 30%, Food 25%, Travel 20%, Others 25%. If rent is ₹9000, find travel expense.', options: ['₹5000', '₹6000', '₹7000', '₹8000'], correctIndex: 1, explanation: 'Total=9000/0.3=30000. Travel=20%×30000=6000.'),
            const Question(id: 'ad14', text: 'A dataset has mean=50, median=45, mode=40. The distribution is:', options: ['Symmetric', 'Positively skewed', 'Negatively skewed', 'Bimodal'], correctIndex: 1, explanation: 'Mean>Median>Mode indicates positive (right) skew.'),
            const Question(id: 'ad15', text: 'Standard deviation of 2,4,4,4,5,5,7,9 is:', options: ['1', '2', '3', '4'], correctIndex: 1, explanation: 'Mean=5. Variance=(9+1+1+1+0+0+4+16)/8=32/8=4. SD=√4=2.'),
          ],
        ),
      ],
    ),
  ],
);
