import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
int count=0;

void setup() {
  size(640, 520);
  background(255);
  tracker = new KinectTracker(this);
}

void draw() {
  //

  // Run the tracking analysis
  tracker.track();
  
  //Show the image
  //tracker.display();


  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);

  noStroke();
  ellipse(v1.x, v1.y, 20, 20);
  count++;
  println(count);
 
  if(count>1000)
  {
    background(255);
    count=0;
  }
  
  // Display some info
  int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " +
    "UP increase threshold, DOWN decrease threshold", 10, 500);
}

// Adjust the threshold with key presses
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t +=10;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t -=10;
      tracker.setThreshold(t);
    }
  }
}
