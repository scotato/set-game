#  [Set Game](https://en.wikipedia.org/wiki/Set_(card_game))

## Format

The deck consists of 81 unique cards that vary in four features across three possibilities for each feature:
* number of shapes (one, two, or three)
* shape (diamond, squiggle, oval)
* shading (solid, striped, or open)
* color (red, green, or purple).

Each possible combination of features (e.g. a card with [three] [striped] [green] [diamonds])
appears as a card precisely once in the deck.

Certain combinations of three cards are said to make up a set. For each one of the four categories of features — color, number, shape, and shading, the three cards must display that feature as a) either all the same, or b) all different. Put another way: For each feature the three cards must avoid having two cards showing one version of the feature and the remaining card showing a different version.

For example, 3 solid red diamonds, 2 solid green squiggles, and 1 solid purple oval form a set, because the shadings of the three cards are all the same, while the numbers, the colors, and the shapes among the three cards are all different.

For any "set", the number of features that are all the same and the number of features that are all different may break down as 0 the same + 4 different; or 1 the same + 3 different; or 2 the same + 2 different; or 3 the same + 1 different. (It cannot break down as 4 features the same + 0 different as the cards would be identical, and there are no identical cards in the Set deck.)

## Game Types

Several games can be played with these cards, all involving the concept of a set. A set consists of three cards satisfying all of these conditions: 
* They all have the same number or have three different numbers.
* They all have the same shape or have three different shapes.
* They all have the same shading or have three different shadings.
* They all have the same color or have three different colors.

## Rules

The rules of Set are summarized by: If you can sort a group of three cards into "two of ____ and one of ____", then it is not a set.

For example, these three cards form a set:
* One red striped diamond
* Two red solid diamonds
* Three red open diamonds
Given any two cards from the deck, there is one and only one other card that forms a set with them.

In the standard Set game, the dealer lays out cards on the table until either twelve are laid down or someone sees a set and calls "Set!". The player who called "Set" takes the cards in the set, and the dealer continues to deal out cards until twelve are on the table. A player who sees a set among the twelve cards calls "Set" and takes the three cards, and the dealer lays three more cards on the table. (To call out "set" and not pick one up quickly enough results in a penalty.) It is possible that there is no set among the twelve cards; in this case, the dealer deals out three more cards to make fifteen dealt cards, or eighteen or more, as necessary. This process of dealing by threes and finding sets continues until the deck is exhausted and there are no more sets on the table. At this point, whoever has collected the most sets wins.

Variants were included with the Set game that involve different mechanics to find sets, as well as different player interaction. Additional variants continue to be created by avid players of the game.

## Objectives

- [ ] 1. Implement a game of solo (i.e. one player) Set.
- [ ] 2. When your game is run for the very first time, there should briefly be no cards showing, but as soon as it appears, it should immediately deal 12 cards by having them “fly in” from random off-screen locations.
- [x] 3. As the game play progresses, use all the real estate on the screen in an efficient manner. Cards should get smaller (or larger) as more (or fewer) appear on-screen at the same time, while always using as much space as is available and still being “nicely arranged”. Grid does all this and you are welcome to use it. All changes to locations and/or sizes of cards must be animated. 
- [x] 4. Cards can have any aspect ratio you like, but they must all have the same aspect ratio at all times (no matter their size and no matter how many are on screen at the same time). In other words, cards can be appearing to the user to get larger and smaller as the game goes on, but the cards cannot be “stretching” into different aspect ratios as the game is played. 
- [x] 5. The symbols on cards should be proportional to the size of the card (i.e. large cards should have large symbols and smaller cards should have smaller symbols). 
- [x] 6. Users must be able to select up to 3 cards by touching on them in an attempt to make a Set (i.e. 3 cards which match, per the rules of Set). It must be clearly visible to the user which cards have been selected so far. 
- [ ] 7. After 3 cards have been selected, you must indicate whether those 3 cards are a match or mismatch. You can show this any way you want (colors, borders, backgrounds, animation, whatever). Anytime there are 3 cards currently selected, it must be clear to the user whether they are a match or not (and the cards involved in a non-matching trio must look different than the cards look when there are only 1 or 2 cards in the selection). 
- [x] 8. Support “deselection” by touching already-selected cards (but only if there are 1 or 2 cards (not 3) currently selected).
- [ ] 9. When any card is touched on and there are already 3 matching Set cards selected, then … a. as per the rules of Set, replace those 3 matching Set cards with new ones from the deck b. the matched cards should fly away (animated) to random locations off-screen c. the replacement cards should fly in (animated) from other random off-screen locations (or from a “deck” view somewhere on screen, see Extra Credit) d. if the deck is empty then the space vacated by the matched cards (which cannot be replaced) should be made available to the remaining cards (i.e. they’ll likely get bigger) e. if the touched card was not part of the matching Set, then select that card 
- [x] 10.When any card is touched and there are already 3 non-matching Set cards selected, deselect those 3 non-matching cards and select the touched-on card (whether or not it was part of the non-matching trio of cards). 
- [ ] 11.You will need to have a “Deal 3 More Cards” button (per the rules of Set). a. when it is touched, replace the selected cards if the selected cards make a Set (with fly-in/fly-away as described above) b. or, if the selected cards do not make a Set (or if there are fewer than 3 cards selected, including none), fly in (i.e. animate the arrival of) 3 new cards to join the ones already on screen (and do not affect the selection) c. disable this button if the deck is empty 
- [ ] 12.You also must have a “New Game” button that starts a new game (i.e. back to 12 randomly chosen cards). Cards should fly in and out when this happens as well. 
- [x] 13.To make your life a bit easier, you can replace the “squiggle” appearance in the Set game with a rectangle. 
- [x] 14.You must author your own Shape struct to do the diamond. 
- [x] 15.Another life-easing change is that you can use a semi-transparent color to represent the “striped” shading. Be sure to pick a transparency level that is clearly distinguishable from “solid”. 
- [x] 16.You can use any 3 colors as long as they are clearly distinguishable from each other. 
- [x] 17.You must use an enum as a meaningful part of your solution. 
- [x] 18.You must use a closure (i.e. a function as an argument) as a meaningful part of your solution. 
- [x] 19.Your UI should work in portrait or landscape on any iOS device. This probably will not require any work on your part (that’s part of the power of SwiftUI), but be sure to experiment with running on different simulators in Xcode to be sure. 
