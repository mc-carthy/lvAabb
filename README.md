# Axis-aligned bounding-box demo

A small demo showcasing the AABB collision detection algorithm. One box moves with WASD, the other will follow the mouse cursor. Each of the following four conditions are checked:

* The left-most edge of BoxA is to the left of the right-most edge of BoxB
* The right-most edge of BoxA is to the right of the left-most edge of BoxB
* The top-most edge of BoxA is above the bottom-most edge of BoxB
* The bottom-most edge of BoxA is below the top-most edge of BoxB

Each edge that is checked with light up green if positive, or red if negative. A collision has been detected when all four lines are green.
