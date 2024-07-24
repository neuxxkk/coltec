public class Trigger { //<>//
    private String origB, destB;

    private void display() {
      if (onRoute >=3) drawX(map.screenPosX(routePos[1][0]), map.screenPosY(routePos[1][1]));
        switch (onRoute) {
            case 3:
                goBtn();
                routeInfo();
                break;
            case 4:
                aStarBtn();
                dijstrakaBtn();
                break;
            case 5:
                stopBtn();
                simulateBtn();
                break;
            default:
                if (onRoute > 0) {
                    routeInfo();
                } else if (onRoute == 0) {
                    routeBtn();
                }
        }
    }

    public boolean btnTrigger(int x, int y) {
        switch (onRoute) {
            case 0:
                if (routeBtnV(x, y)) {
                    println("OnRoute");
                    onRoute = 1;
                    return true;
                }
                break;
            case 3:
                if (goBtnV(x, y)) {
                    onRoute = 4;
                    return true;
                }
                break;
            case 4:
                if (aStarBtnV(x, y)) {
                    route = new Route(routePos[0], routePos[1], 'a');
                    onRoute = 5;
                    return true;
                } else if (dijstrakaBtnV(x, y)) {
                    route = new Route(routePos[0], routePos[1], 'd');
                    onRoute = 5;
                    return true;
                }
                break;
            case 5:
                if (stopBtnV(x, y)) {
                    route.off();
                    return true;
                } else if (simulateBtnV(x, y)) {
                    route.makeWay();
                    //route.off();
                    return true;
                }
                break;
        }
        return false;
    }
    
    float startX1 = 10, startY = 10;
    float largBloco1 = 300, altBloco1 = 60;
    float largBloco2 = 54, altBloco2 = 54;

    private void routeBtn() {
        float startX = startX1;
        float largBloco = largBloco1;
        float altBloco = altBloco1;
        drawButton(startX, largBloco, altBloco, "Select route", color(220, 180, 78), startX + largBloco * 0.27, altBloco * 0.8);
    }

    private void simulateBtn() {
        float startX = startX1;
        float largBloco = largBloco1;
        float altBloco = altBloco1;
        drawButton(startX, largBloco, altBloco, "Simulate route", color(150, 150, 250), startX + largBloco * 0.25, altBloco * 0.8);
    }

    private void goBtn() {
        float largBloco = largBloco2;
        float altBloco = altBloco2;
        float startX = width - largBloco*1.2;
        drawButton(startX, largBloco, altBloco, "GO", color(50, 150, 50), startX + largBloco * 0.2, altBloco * 0.85);
    }

    private void stopBtn() {
        float largBloco = tileSize * 5;
        float altBloco = altBloco2;
        float startX = width - largBloco*1.1;
        drawButton(startX, largBloco, altBloco, "STOP", color(150, 50, 50), startX + largBloco * 0.2, altBloco * 0.85);
    }

    private void aStarBtn() {
        float largBloco = largBloco2;
        float altBloco = altBloco2;
        float startX = width - largBloco*1.2;
        drawButton(startX, largBloco, altBloco, "A*", color(255, 150, 50), startX + largBloco * 0.3, altBloco * 0.8);
    }

    private void dijstrakaBtn() {
        float largBloco = tileSize * 6;
        float altBloco = altBloco2;
        float startX = width - largBloco*2;
        drawButton(startX, largBloco, altBloco, "Dijstraka", color(50, 150, 50), startX + largBloco * 0.1, altBloco * 0.8);
    }

    private void drawButton(float startX, float largBloco, float altBloco, String text, color c, float txtX, float txtY) {
        fill(c, 230);
        rect(startX, startY, largBloco, altBloco, 10);
        fill(0);
        textSize(27);
        text(text, txtX, txtY);
    }

    private void routeInfo() {
        String start = (String.format("(%d, %d) - %s", routePos[0][0], routePos[0][1], origB));
        String goal = (String.format("(%d, %d) - %s", routePos[1][0], routePos[1][1], destB));
        float startX = startX1;
        float largBloco = 260;
        float altBloco = 80;
        drawButton(startX, largBloco, altBloco, start + "\n" + goal, color(220, 180, 78), startX*3, altBloco * 0.5);
    }

    private boolean routeBtnV(int x, int y) {
        return isWithinBounds(x, y, startX1, largBloco1, altBloco1);
    }

    private boolean simulateBtnV(int x, int y) {
        return isWithinBounds(x, y, startX1, largBloco1, altBloco1);
    }
    private boolean goBtnV(int x, int y) {
        return isWithinBounds(x, y, width - (20 * 3.25), largBloco2, altBloco2);
    }

    private boolean stopBtnV(int x, int y) {
        return isWithinBounds(x, y, width - (tileSize * 5.5), tileSize * 5, altBloco2);
    }

    private boolean aStarBtnV(int x, int y) {
        return isWithinBounds(x, y, width - (20 * 3.25), largBloco2, altBloco2);
    }

    private boolean dijstrakaBtnV(int x, int y) {
        return isWithinBounds(x, y, width - (tileSize*12), tileSize * 6, altBloco2);
    }

    private boolean isWithinBounds(int x, int y, float startX, float largBloco, float altBloco) {
        float endX = startX + largBloco;
        float endY = startY + altBloco;
        return x > startX && x < endX && y > startY && y < endY;
    }
    
    void drawX(int screenX, int screenY){
      float xCenter = screenX;
      float yCenter = screenY;
      float rectWidth = tileSize/3;
      float rectHeight = tileSize;
      pushMatrix();
      translate(xCenter, yCenter);
      rotate(radians(45));
      rect(-rectWidth/2, -rectHeight/2, rectWidth, rectHeight);
      popMatrix();
      
      // Desenhar segunda linha diagonal do X
      pushMatrix();
      translate(xCenter, yCenter);
      rotate(radians(-45));
      rect(-rectWidth/2, -rectHeight/2, rectWidth, rectHeight);
      popMatrix();
  }
}
