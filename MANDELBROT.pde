float x, y, xx, yy, zx, zy, cx, cy, xwidth, yheight, c, abs; // 6/400, used to calculate incr value
int iterations=255, n;

void setup(){
  size(1000,1000);
  colorMode(HSB, 255);  //using HSB so we can see different colours for different values of n instead of shades of just one colour
}
  
   //<>//
 void draw(){
   
    for(xx=0; xx<=width; xx++){  //goes through every number on x axis with a range if -3 and 3
   
    x=xx;  //copy xx to x as to keep xx the same
    xwidth = x;  //set xwidth variable to value of x so we can draw point with that x value on plane
    x = map(x, 100, 1100, -2, 1.5);  //map x from range of plane to range of -3 to 3 so we can use for function 
    //(zooms in to the mandelbrot set as it goes to infinity at (0.75,0) and we wont be able to see that if we are working with range of 0,400)

      for(yy=0; yy<=height; yy++){  //goes through every number on y axis with a range if -3 and 3
      
      y=yy;  //copy yy to y as to keep yy the same
      yheight = y;  //set yheight variable to value of y so we can draw point with that y value on plane
      y = map(y, 0, 1000, -2, 1.5);  //map y from range of plane to range of -3 to 3 so we can use for function
      //(zooms in to the mandelbrot set as it goes to infinity at (0,-1.5) and we wont be able to see that if we are working with range of 0,400)
     
      cx = x;  //saving the original real part of c in a variable
      cy = y;  //saving the original imaginary part of c in a variable
                    
      for(n=1; n<iterations; n++){  //runs the functions 60 times to see if it goes to infinity or not       
        //square a complex number and then add the original complex number to it
        
        zx = sq(cx) - sq(cy);  //getting the real squared part of c
        zy = 2 * cx * cy;  //getting the imaginary squared part of c
        
        cx = zx + x; //adding the original real part of c to the squared real part and setting it as the next real part of z
        cy = zy + y; //adding the original imaginary part of c to the squared imaginary part and setting it as the next real part of z
        
        abs = sqrt(sq(cx) + sq(cy));  //abs value of a complex number, in this case abs value of our z
        
        if(abs > 5) break; //if the cooridnates cx,cy goes to infinity, get out of the loop (if it goes past 5 we know its going to infinity)       
        }
        
          if(n==iterations){
            set(int(xwidth), int(yheight), color(0,0,0));  //set the points that go to infinity to black
          } 
          else{
            c = (n+175) % 255;  //sets c to a value based on n (iterations), added 185 to change the colour range (was originally red)
            set(int(xwidth), int(yheight), color(c,255,255));  //assigns that pixel to a hue value as we want a colour change
          }
      }    
   }   
}
