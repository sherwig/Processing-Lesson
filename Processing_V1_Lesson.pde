
import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;
int count=0;

void setup() 
{
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  background(255);
}

void draw() {
  // Run the tracking analysis
  tracker.track();
  
  // Show the image. Comment out to draw circles.
  tracker.display();
  
     //Creates a PVector that holds the average position 
     PVector v1 = tracker.getPos();
     noStroke();
     //Adding in coloring 
     fill(50, 100, 250, 200);
     //Draws the data from the vector. 
     ellipse(v1.x, v1.y, 20, 20);
     count++;
     
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
      t+=10;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=10;
      tracker.setThreshold(t);
    }
  }
}
