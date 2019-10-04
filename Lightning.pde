// The variable holding the bean stalk object
Forest aForest;

void setup() {
	// Set framerate
	frameRate(15);
	// Set window size
	size(500, 500);
	// Style
	noStroke();
	// Draw the background
	background(113, 163, 245);
	// Draw the ground
	fill(70, 200, 50);
	rect(0, height - 200, width, 200);
	// Initializes the bean stalk
	aForest = new Forest(width/2, height - 100, width, 50, 100);
}

void draw() {
	aForest.updateAndDrawForest();
}

class Forest {
	// The center of the forest and the thickness
	float x, y, thickness;
	int numOfSegments; // The number of segments of each stalk
	int currentSegment = 0;
	RandomLine[] lines; // An array holding all the lines of the bean stalk

	Forest(float argX, float argY, float argThickness, int argNumOfSegments, int numOfStalks) {
		x = argX;
		y = argY;
		thickness = argThickness;
		numOfSegments = argNumOfSegments;
		lines = new RandomLine[numOfStalks]; // Creates an array equal to the number o lines
		for(int i = 0; i < numOfStalks; i++) { // Fills array with lines of random color
			lines[i] = new RandomLine((float)(x + (Math.random() * thickness - thickness/2.0)), y + (float)(Math.random() * 100 - 50), color((float)(Math.random() * 255), (float)(Math.random() * 255), (float)(Math.random() * 255), (float)(Math.random() * 255)));
		}
	}

	void updateAndDrawForest() { // Updates all lines of the Forest
		if(currentSegment < numOfSegments) { // Runs only if the number of segments hasn't reached the max
			for(int i = 0; i < lines.length - 1; i++) {
				lines[i].updateAndDraw();
			}
			currentSegment++; // Adds a segment to current segment each time update is run
		}
	}
}

class RandomLine {
	// The current position of the line
	float x, y, weight;
	color lineColor;

	RandomLine(float argX, float argY, int argLineColor) {
		x = argX;
		y = argY;
		weight = (float)(Math.random() * 20); // Picks a random weight
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
