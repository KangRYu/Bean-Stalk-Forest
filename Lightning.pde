void settings() {
	fullScreen();
}

void setup() {
	// Style
	noStroke();
	// Draw the ground
	fill(70, 200, 50);
	rect(0, height - 200, width, 200);
	// Draw the tree
	int numOfBranches = 20; // The number of branches that the program draws to make the tree
	for(int i = 0; i < numOfBranches; i++) {
		drawLightning(width/2, height - 100, 50);
	}
}

void drawLightning(float startX, float startY, int length) {
	// Set current position to the starting position
	float x = startX;
	float y = startY;
	// Set the style of the lightning bolt
	push();
	stroke(201, 135, 42);
	strokeWeight(10);

	for(int i = 0; i < length; i++) {
		// Figure out the displacement of the end point
		float displaceX = (float)(Math.random() * (100 * i/(length - 1)) - (50 * i/(length - 1)));
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