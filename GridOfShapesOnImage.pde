// Grid Of Shapes On Image v 0.2
// Code by Casey Scalf
// March, 2022
// Sketch for writing geometry over images

import processing.pdf.*;

PImage source;

// Density of points to sample
int spacing = 10;

// Use this as the smallest and largest the shape can get
float minSize = 0.0;
float maxSize = 15.0;

//////////////////////////////////////////////////////////////////////////////////////////////

void setup() {

  // Use for recording to file. Will save in same path as sketch
  size(980, 940, PDF, "SourceOut.pdf");

  // Use for prototyping
  //size(980, 940, P3D);

  // Needed for some computers with P3D to work right
  frameRate(30);

  // Name of your image goes here. Use a square or change the size()
  source = loadImage("Tree980A.jpg");
  rectMode(CENTER);
  noFill();
  strokeWeight(1 );
  noLoop();
  
} // End Setup

//////////////////////////////////////////////////////////////////////////////////////////////

void draw() {

  // Comment out if transparent background is needed
  background(0);
  
  // Use to display source image behind shapes
  //image(source, 0, 0, width, height);

  // Run through grid of points, get color, then do the shape
  for (int x = 0; x < width; x = x + spacing) {
    for (int y = 0; y < height; y = y + spacing) {

      // Get color from point
      color pix = source.get(x, y);

      //// Option A Conversion to greyscale taken from Generative Processing
      //int greyscale =round(red(pix)*0.222+green(pix)*0.707+blue(pix)*0.071); 
      //stroke(greyscale);
      //greyscale = int(map(greyscale, 0, 255, 0, 10));
      //rect(x, y, 2 + greyscale, 2 + greyscale);

      // OR

      // Option B Use color from image
      stroke(pix);
      //fill(pix);
      float size = brightness(pix);
      size = map(size, 0.0, 255.0, minSize, maxSize);
      rect(x, y, size, size);
      
    }
  }

  println("Finished.");
  exit();
  
} // End Draw

//////////////////////////////////////////////////////////////////////////////////////////////
