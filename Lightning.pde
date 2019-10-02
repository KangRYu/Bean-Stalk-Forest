void settings() {
	fullScreen();
}

void setup() {
	// Style
	noStroke();
	// Draw the ground
	fill(70, 200, 50);
	rect(0, height - 200, width, 200);
	// Call the draw tree function
	drawTree(50, 80, 25);
}

void drawTree(float thickness, int numOfSegments, int numOfBranches) { // Draws a tree using lightning bolts
	// Draw the tree
	for(int i = 0; i < numOfBranches; i++) {
		drawLightning((float)(width/2.0 + (Math.random() * thickness - thickness/2.0)), height - 100, numOfSegments);
		try {
			Thread.sleep(100);
		}
		catch(InterruptedException e) {
		}
	}
}

void drawLightning(float startX, float startY, int numOfSegments) { // Draws brown lightning bolts
	// Set current position to the starting position
	float x = startX;
	float y = startY;
	// Set the style of the lightning bolt
	push();
	stroke(50, 150, 50);
	strokeWeight(10);

	for(int i = 0; i < numOfSegments; i++) {
		// Figure out the displacement of the end point
		float displaceX = (float)(Math.random() * 15 - 15/2);
		float displaceY = (float)(Math.random() * -20);
		// Draw the line
		line(x, y, x + displaceX, y + displaceY);
		// Update the current position to the end point
		x += displaceX;
		y += displaceY;
	}
	// Undo the style
	pop();
}