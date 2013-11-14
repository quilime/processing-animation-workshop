# Animation w/ Processing

Oct 12 2013


## Processing.org
http://processing.org


Processing is a programming language developed for and by artists. 
It is a supportive community engaged in teaching, sharing, and learning.
The language is based on the JAVA, and retains many similarities. 
The Processing software is free and open source, and runs on the Mac, Windows, and GNU/Linux platforms.

### Learning by Disection, Tweaking, and Searching
- Keep notes, copy/paste, save links, make a mess
- learn by tweaking out and saving code of examples you find interesting
- Read code, read comments, ask questions
- Number fudging. Change and re-load.

### Processing Resources
- [Examples](http://processing.org/examples/)
- [Tutorials](http://processing.org/tutorials/)
- [Reference](http://processing.org/reference/)
- [Generative Design (Generative Gestaltung)](http://www.generative-gestaltung.de/code)

### Basics
- Variables, Data, Input

### Graphics
- [setup()](http://processing.org/reference/setup_.html), [draw()](http://processing.org/reference/draw_.html) 
- [background()](http://processing.org/reference/background_.html) 
- [point()](http://processing.org/reference/point_.html), [line()](http://processing.org/reference/line_.html), [rect()](http://processing.org/reference/rect_.html), [triangle()](http://processing.org/reference/triangle_.html), [shape()](http://processing.org/reference/beginShape_.html)
- [fill()](http://processing.org/reference/fill_.html), [noFill()](http://processing.org/reference/noFill_.html)
- [stroke()](http://processing.org/reference/stroke_.html), [strokeWeight()](http://processing.org/reference/strokeWeight_.html)

### Code Concepts and Techniques for Animation
- Logic [if()](http://processing.org/reference/if.html), [modulo (%)](http://processing.org/reference/modulo.html)
- Orientation [atan2()](http://processing.org/reference/atan2_.html)
- Oscillation [sin()](http://processing.org/reference/sin_.html), [cos()](http://processing.org/reference/cos_.html)
- Iteration [for()](http://processing.org/reference/for.html), [while()](http://processing.org/reference/while.html)
- Value Transformation [map()](http://processing.org/reference/map_.html), [constrain()](http://processing.org/reference/constrain_.html), [lerp()](http://processing.org/reference/lerp_.html), [dist()](http://processing.org/reference/dist_.html)

### Output
- [saveFrame()](http://processing.org/reference/saveFrame_.html)

## GIF

## Characteristics of the GIF Format
### History
- Created by CompuServe in 1987
- *FACT* The creators of the format pronounced GIF as "Jif". The intended pronunciation deliberately echoes the American peanut butter brand, and CompuServe employees would often say "Choosy developers choose GIF", spoofing this brand's television commercials. (I personally pronounce GIF with a hard G, even though it's "wrong" according to the creators).

#### GIF Features
- Sequences of Frames with unique time-lengths per frame
- Animations can loop (or not)
- Each frame can have its own 256 color pallete
- Lossless Format (Meaning no artifacts like JPEG), great for hard-edge graphics
- *Caveat*: GIF's with lots of frames can have a cumbersome filesize (multiple MB's)

### GIF Creation
- https://github.com/kohler/gifsicle
- http://www.nyctergatis.com/gifbuilder/
- http://blog.iharder.net/2009/10/22/gif-create-animated-gifs-with-mac-os-x-preview-app/

## Reference
- [Worms](http://media.quilime.com/?p=src/processing/vector_worms/)

