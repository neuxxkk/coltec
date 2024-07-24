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

    private void routeBtn() {
        float startX = tileSize / 2;
        float startY = tileSize / 2;
        float largBloco = tileSize * 15;
        float altBloco = tileSize * 3;
        drawButton(startX, startY, largBloco, altBloco, "Select route", color(220, 180, 78), startX + largBloco * 0.27, altBloco * 0.8);
    }

    private void simulateBtn() {
        float startX = tileSize / 2;
        float startY = tileSize / 2;
        float largBloco = tileSize * 15;
        float altBloco = tileSize * 3;
        drawButton(startX, startY, largBloco, altBloco, "Simulate route", color(150, 150, 250), startX + largBloco * 0.25, altBloco * 0.8);
    }

    private void goBtn() {
        float largBloco = tileSize * 2.7;
        float altBloco = tileSize * 2.7;
        float startX = width - largBloco*1.2;
        float startY = tileSize / 2;
        drawButton(startX, startY, largBloco, altBloco, "GO", color(50, 150, 50), startX + largBloco * 0.2, altBloco * 0.85);
    }

    private void stopBtn() {
        float largBloco = tileSize * 5;
        float altBloco = tileSize * 2.7;
        float startX = width - largBloco*1.1;
        float startY = tileSize / 2;
        drawButton(startX, startY, largBloco, altBloco, "STOP", color(150, 50, 50), startX + largBloco * 0.2, altBloco * 0.85);
    }

    private void aStarBtn() {
        float largBloco = tileSize * 2.7;
        float altBloco = tileSize * 2.7;
        float startX = width - largBloco*1.2;
        float startY = tileSize / 2;
        drawButton(startX, startY, largBloco, altBloco, "A*", color(255, 150, 50), startX + largBloco * 0.3, altBloco * 0.8);
    }

    private void dijstrakaBtn() {
        float largBloco = tileSize * 6;
        float altBloco = tileSize * 2.7;
        float startX = width - largBloco*2;
        float startY = tileSize / 2;
        drawButton(startX, startY, largBloco, altBloco, "Dijstraka", color(50, 150, 50), startX + largBloco * 0.1, altBloco * 0.8);
    }

    private void drawButton(float startX, float startY, float largBloco, float altBloco, String text, color c, float txtX, float txtY) {
        fill(c, 230);
        rect(startX, startY, largBloco, altBloco, 10);
        fill(0);
        textSize(27);
        text(text, txtX, txtY);
    }

    private void routeInfo() {
        String start = (String.format("(%d, %d) - %s", routePos[0][0], routePos[0][1], origB));
        String goal = (String.format("(%d, %d) - %s", routePos[1][0], routePos[1][1], destB));
        float startX = tileSize / 2;
        float startY = tileSize / 2;
        float largBloco = tileSize * 13;
        float altBloco = tileSize * 4;
        drawButton(startX, startY, largBloco, altBloco, start + "\n" + goal, color(220, 180, 78), startX*3, altBloco * 0.5);
    }

    private boolean routeBtnV(int x, int y) {
        return isWithinBounds(x, y, tileSize / 2, tileSize / 2, tileSize * 15, tileSize * 3);
    }

    private boolean simulateBtnV(int x, int y) {
        return isWithinBounds(x, y, tileSize / 2, tileSize / 2, tileSize * 15, tileSize * 3);
    }

    private boolean goBtnV(int x, int y) {
        return isWithinBounds(x, y, width - (tileSize * 3.25), tileSize / 2, tileSize * 2.7, tileSize * 2.7);
    }

    private boolean stopBtnV(int x, int y) {
        return isWithinBounds(x, y, width - (tileSize * 5.5), tileSize / 2, tileSize * 5, tileSize * 2.7);
    }

    private boolean aStarBtnV(int x, int y) {
        return isWithinBounds(x, y, width - (tileSize * 3.25), tileSize / 2, tileSize * 2.7, tileSize * 2.7);
    }

    private boolean dijstrakaBtnV(int x, int y) {
        return isWithinBounds(x, y, width - (tileSize*12), tileSize / 2, tileSize * 6, tileSize * 2.7);
    }

    private boolean isWithinBounds(int x, int y, float startX, float startY, float largBloco, float altBloco) {
        float endX = startX + largBloco;
        float endY = startY + altBloco;
        return x > startX && x < endX && y > startY && y < endY;
    }
    
    void drawX(int screenX, int screenY){
      println(screenX);
      float xCenter = screenX;
      float yCenter = screenY;
      float rectWidth = 5;
      float rectHeight = 20;
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
