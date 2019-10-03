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
		drawLightning(, numOfSegments);
	}
}

class BeanStalk {
	// The center of the stalk and the thickness
	float x, y, thickness;
	int numOfSegments; // The number of segments of each stalk
	RandomLine[] lines; // An array holding all the lines of the bean stalk

	BeanStalk(float argX, float argY, float argThickness, int argNumOfSegments, int numOfStalks) {
		x = argX;
		y = argY;
		thickness = argThickness;
		numOfSegments = argNumOfSegments;
		lines = new RandomLine(numOfStalks);
		for(int i = 0; i < numOfStalks; i++) {
			lines[i] = new RandomLine((float)(width/2.0 + (Math.random() * thickness - thickness/2.0)), height - 100, 10, color(Math.random() * 255), Math.random() * 255), Math.random() * 255));
		}
	}

	void updateAndDraw() { // Updates all lines of the beanstalk
		for(int i = 0; i < lines.length - 1; i++) {
			lines[i].updateAndDraw();
		}
	}
}

class RandomLine {
	// The current position of the line
	float x, y, weight;
	int lineColor;

	RandomLine(float argX, float argY, float argWeight, int argLineColor) {
		x = argX;
		y = argY;
		weight = argWeight;
		lineColor = argLineColor;
	}

	void updateAndDraw() {
		// Calculates a random displacement
		float displaceX = (float)(Math.random() * 15 - 15/2);
		float displaceY = (float)(Math.random() * -20);
		// Applies the syle
		push(); // Saves current style
		stroke(lineColor);
		strokeWeight(weight);
		// Draws the line
		line(x, y, x + displaceX, y + displaceY);
		// Update the current position to the end points
		x += displaceX;
		y += displaceY;
		// Undos style
		pop();
	}
}