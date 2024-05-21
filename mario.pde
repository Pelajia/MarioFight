// Variables globales et chargement des images

PImage mario;
PImage landscape;
float landscapeX;
float landscapeSpeed = 2;

int marioLife = 100;
int liguiLife = 100;
int advFrameZeroCount = 0;
int modulo = 3;
float marioX, marioY;
float marioSpeed = 10;
float gravity = 5;
float jumpForce = -50;
float jumpSpeed = jumpForce;
boolean isJumping = false;

PImage adversaireImage;
PImage adversaireImage_;
PImage endImage;
float advX, advY;
float advSpeed = 2;

PImage koopaLeft0, koopaLeft1, koopaRight0, koopaRight1;
PImage fire;
PImage flash;
PImage flash_;
PImage marioKick_;
PImage marioKick;
PImage marioTor_;
PImage marioTor;
PImage marioPunch_;
PImage marioPunch;
PImage marioStyle;
PImage marioHigh;
PImage marioJump;
PImage marioJump_;
PImage marioStand;
PImage marioWalk1;
PImage marioWalk2;
PImage marioWalk3;
PImage marioWalk1_;
PImage marioWalk2_;
PImage marioWalk3_;
PImage shell0;
int marioFrame = 0; // Variable pour suivre le cadre d'animation de Mario
int advFrame = 1;
int lastFrameChangeTime = 0; // Variable pour stocker le temps de la dernière modification de cadre
boolean keyPressedRecently = false; // Variable pour indiquer si une touche a été enfoncée récemment
boolean jkKeyPressed = false; // Variable pour suivre l'état de la touche 'j' ou 'J'
int lastJKeyPressTime = 0; // Variable pour stocker le temps de la dernière activation de la touche 'j' ou 'J'
int keyCooldownDuration = 300; // Durée de l'intervalle de temps en millisecondes avant qu'une nouvelle activation soit autorisée
float landscapePosition = 0;
float ecart;

// Adversaire variables
PImage liguiStand, liguiWalk1, liguiWalk2, liguiWalk1_, liguiWalk2_, liguiWalk3, liguiWalk4, liguiWalk3_;
PImage liguiKick, liguiPunch, liguiTor, liguiKick_, liguiPunch_, liguiTor_, liguiJump;

// Initialiser l'adversaire
Adversaire adversaire;

void setup() {
  size(1330, 680);
  textSize(32);

  // Chargez les images
  landscape = loadImage("landscape.jpg"); // Assurez-vous que l'image est dans le dossier "data"
  landscapeX = 0;
  
  shell0 = loadImage("shell0.png");
  koopaRight0 = loadImage("koopaRight0.png");
  koopaRight1 = loadImage("koopaRight1.png");
  koopaLeft0 = loadImage("koopaLeft0.png");
  koopaLeft1 = loadImage("koopaLeft1.png");
  fire = makeTransparent(loadImage("fire.jpg"), 50);
  flash_ = loadImage("flash_.png");
  flash = loadImage("flash.png");
  endImage = loadImage("end.png");
  marioKick_ = loadImage("marioKick_.jpg");
  marioKick = loadImage("marioKick.jpg");
  marioTor_ = loadImage("marioTor_.png");
  marioTor = loadImage("marioTor.png");
  marioPunch_ = loadImage("marioPunch_.png");
  marioPunch = loadImage("marioPunch.png");
  marioStyle = loadImage("marioStyle.jpg");
  marioHigh = loadImage("marioHigh.png");
  marioJump = loadImage("marioJump.png");
  marioJump_ = loadImage("marioJump_.png");
  marioStand = loadImage("marioStand.png");
  marioWalk1 = loadImage("marioWalk1.jpg");
  marioWalk2 = loadImage("marioWalk2.jpg");
  marioWalk3 = loadImage("marioWalk3.jpg");
  marioWalk1_ = loadImage("marioWalk1g.jpg");
  marioWalk2_ = loadImage("marioWalk2g.jpg");
  marioWalk3_ = loadImage("marioWalk3g.jpg");

  // Make images transparent
  marioStyle = makeTransparent(marioStyle, 20); 
  marioWalk1_ = makeTransparent(marioWalk1_, 20);
  marioWalk2_ = makeTransparent(marioWalk2_, 20);
  marioWalk3_ = makeTransparent(marioWalk3_, 20);
  marioWalk1 = makeTransparent(marioWalk1, 20);
  marioWalk2 = makeTransparent(marioWalk2, 20);
  marioWalk3 = makeTransparent(marioWalk3, 20);
  marioHigh = makeTransparent(marioHigh, 20);
  marioKick = makeTransparent(marioKick, 20);
  marioKick_ = makeTransparent(marioKick_, 20);
  
 // Charger les images de l'adversaire
 //
 liguiStand= createLigui(loadImage("marioStand_.png"));
 liguiWalk1=makeTransparent((createLigui(loadImage("marioWalk1.jpg"))), 20);
 liguiWalk2=makeTransparent((createLigui(loadImage("marioWalk2.jpg"))), 20);
 liguiWalk2_=makeTransparent((createLigui(loadImage("marioWalk2g.jpg"))), 20);
 liguiWalk1_=makeTransparent((createLigui(loadImage("marioWalk1g.jpg"))), 20);
 liguiKick=makeTransparent((createLigui(loadImage("marioKick.jpg"))), 20);
 liguiKick_=makeTransparent((createLigui(loadImage("marioKick_.jpg"))), 20);
 liguiPunch=createLigui(loadImage("marioPunch.png"));
 liguiPunch_=createLigui(loadImage("marioPunch_.png"));
 liguiTor=createLigui(loadImage("marioTor.png"));
 liguiTor_=createLigui(loadImage("marioTor_.png"));
 liguiWalk3=makeTransparent((createLigui(loadImage("marioWalk3.jpg"))), 20);
 liguiWalk3_=makeTransparent((createLigui(loadImage("marioWalk3g.jpg"))), 20);
  




 //liguiWalk4=loadImage("liguiWalk4.png");
 //
  /*adversMarioStand = transformColors(marioStand);
  adversMarioWalk1 = transformColors(marioWalk1);
  adversMarioWalk2 = transformColors(marioWalk2);
  adversMarioWalk3 = transformColors(marioWalk3);
  adversMarioKick = transformColors(marioKick);
  adversMarioPunch = transformColors(marioPunch);
  adversMarioTor = transformColors(marioTor_);
  adversMarioJump = transformColors(marioJump);

  adversMarioWalk1_ = transformColors(marioWalk1_);
  adversMarioWalk2_ = transformColors(marioWalk2_);
  adversMarioWalk3_ = transformColors(marioWalk3_);
  adversMarioKick_ = transformColors(marioKick_);
  adversMarioPunch_ = transformColors(marioPunch_);
  adversMarioTor_ = transformColors(marioTor);
  */
  // Position initiale de Mario
  marioX = width / 2;
  marioY = height -200;

  // Initialiser l'adversaire
  adversaire = new Adversaire(width, height -200, 10);
}
//__________________________________________Draw______________________________________________//
void draw() {
  background(0); // Fond noir

  // Mise à jour de la position du paysage
  landscapeX -= landscapeSpeed;
  if (landscapeX <= -landscape.width) {
    landscapeX += landscape.width;
  }

  // Dessiner le paysage
  image(landscape, landscapeX, 0, landscape.width, height);
  image(landscape, landscapeX + landscape.width, 0, landscape.width, height);
  image(landscape, landscapeX - landscape.width, 0, landscape.width, height);

  // Déplacer et afficher l'adversaire
  adversaire.moveTowards(marioX);
  adversaire.display(marioX);

  // Dessiner Mario
  drawMario();
  moveMario(adversaire);

  // Combat
  if ((marioX - adversaire.getX() <= 225 && marioX - adversaire.getX() >= 0) ||
      (adversaire.getX() - marioX <= 225 && adversaire.getX() - marioX > 0)) {
    if ((marioX - adversaire.getX() <= 100 && marioX - adversaire.getX() >= 0) ||
        (adversaire.getX() - marioX <= 100 && adversaire.getX() - marioX > 0)) {
      marioFrame = 0;
      adversaire.attack(true);
    }
    if (marioFrame == 9 || marioFrame == -9) {
      if (adversaire.getAdvImage() == liguiPunch_ || adversaire.getAdvImage() == liguiPunch) {
        marioLife -= 3;
        liguiLife -= 3;
      } else if (adversaire.getAdvImage() == liguiKick_ || adversaire.getAdvImage() == liguiKick) {
        liguiLife -= 5;
      } else if (adversaire.getAdvImage() == fire) {
        marioLife -= 10;
        liguiLife -= 3;
      } else {
        liguiLife -= 5;
      }
    } else if (marioFrame == 7 || marioFrame == -7) {
      if (adversaire.getAdvImage() == liguiPunch_ || adversaire.getAdvImage() == liguiPunch) {
        marioLife -= 5;
      } else if (adversaire.getAdvImage() == liguiKick_ || adversaire.getAdvImage() == liguiKick) {
        liguiLife -= 5;
        marioLife -= 5;
      } else if (adversaire.getAdvImage() == fire) {
        marioLife -= 10;
      } else {
        liguiLife -= 5;
      }
    } else if (marioFrame == 8 || marioFrame == -8) {
      if (marioX < adversaire.getX()) {
        if (marioFrame == 8) {
          if (adversaire.getAdvImage() == liguiPunch_ || adversaire.getAdvImage() == liguiPunch) {
            marioLife -= 10;
          } else if (adversaire.getAdvImage() == liguiKick_ || adversaire.getAdvImage() == liguiKick) {
            liguiLife -= 10;
          } else if (adversaire.getAdvImage() == fire) {
            marioLife -= 10;
          } else {
            liguiLife -= 10;
          }
        }
      } else {
        if (marioFrame == -8) {
          if (adversaire.getAdvImage() == liguiPunch_ || adversaire.getAdvImage() == liguiPunch) {
            marioLife -= 10;
          } else if (adversaire.getAdvImage() == liguiKick_ || adversaire.getAdvImage() == liguiKick) {
            liguiLife -= 10;
          } else if (adversaire.getAdvImage() == fire) {
            marioLife -= 10;
          } else {
            liguiLife -= 10;
          }
        }
      }
    } else {
      if (adversaire.getAdvImage() == liguiPunch_ || adversaire.getAdvImage() == liguiPunch) {
        marioLife -= 3;
      } else if (adversaire.getAdvImage() == liguiKick_ || adversaire.getAdvImage() == liguiKick) {
        marioLife -= 5;
      } else if (adversaire.getAdvImage() == fire) {
        marioLife -= 10;
      }
    }
  } else {
    adversaire.attack(false);
  }

  // Affichage des vies de Mario et de Ligui
  fill(255); // Couleur blanche pour le texte
  text("MARIO : " + marioLife, 100, 100);
  text("LIGUI : " + liguiLife, width - 200, 100);

  // Vérifier la fin du jeu
  if (marioLife <= 0 || liguiLife <= 0) {
    fill(255, 0, 0); // Couleur rouge pour le texte de fin
    textSize(64); // Taille du texte plus grande pour le texte de fin
    textAlign(CENTER, CENTER);
    if (marioLife <= 0) {
      text("LIGUI GAGNE!", width / 2, height / 2);
    } else {
      text("MARIO GAGNE!", width / 2, height / 2);
    }
    noLoop(); // Arrête la boucle de dessin
  }
}


//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//

void drawMario() {
  // switch case pour dessiner l'image appropriée en fonction de marioFrame
  switch (marioFrame) {
    case 0:
      image(marioStand, marioX, marioY, 100, 100); // Dessine mario
      break;
    case 1:
      marioWalk1 = makeTransparent(marioWalk1, 20);
      image(marioWalk1, marioX, marioY, 100, 100); // Dessine marioWalk1
      break;
    
    case 2:
      marioWalk2 = makeTransparent(marioWalk2, 20);
      image(marioWalk2, marioX, marioY, 100, 100); // Dessine marioWalk2
      break;
    case 3:
      marioWalk3 = makeTransparent(marioWalk3, 20);
      image(marioWalk3, marioX, marioY, 100, 100); // Dessine marioWalk3
      break;
    case -1:
      
      image(marioWalk1_, marioX, marioY, 100, 100); // Dessine marioWalk1
      break;
    
    case -2:

      image(marioWalk2_, marioX, marioY, 100, 100); // Dessine marioWalk2
      break;
    case -3:
      
      image(marioWalk3_, marioX, marioY, 100, 100); // Dessine marioWalk3
      break;
    case 4:

      image(marioHigh, marioX, marioY, 100, 100); // Dessine marioWalk3
      break;
    case -4:
      image(marioStyle, marioX, marioY, 100, 100); // Dessine marioWalk3
      break;
    case 7:
      startDisplayImage();
      displayImage(marioKick, marioX+50, marioY-30, 160, 100, 300);
      break;
    case -7:
      startDisplayImage();
      displayImage(marioKick_, marioX-50, marioY-30, 160, 100, 300);//marioKick_
      break;
    case 8:
      image(marioTor, marioX+30, marioY + 30, 150, 70);//TorMario
      startDisplayImage();
      displayImage(fire, marioX+100, marioY-120, 280, 220, 1000);
      break;
    case -8: 
      image(marioTor_, marioX, marioY+30, 150, 70);//TorMario_
      startDisplayImage();
      displayImage(fire, marioX-180,marioY-120, 280, 220, 1000);
      break;
    case 9:
      image(marioPunch, marioX + 50, marioY, 150, 100);//Punch
      break;
    case -9:
      image(marioPunch_, marioX - 100, marioY, 150, 100);//Punch_
      break;
    case 10:
      image(marioJump, marioX, marioY, 100, 100); // Dessine marioWalk3
      break;
    case -10:
      image(marioJump_, marioX, marioY, 100, 100); // Dessine marioWalk3
      break;
  }
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//

void moveMario(Adversaire adversaire) {
  float landscapeShift;
  if (marioX > width * 0.75) {
    ecart = marioX - adversaire.getX();
    landscapeShift = marioX - width * 0.75;
    landscapePosition -= landscapeShift;
    marioX = int(width * 0.75);
    adversaire.setX(marioX - ecart);
    landscapeSpeed = 2;
  }
  
  if (marioX < width * 0.25) {
    ecart = adversaire.getX() - marioX;
    landscapeShift = width * 0.25 - marioX;
    landscapePosition += landscapeShift;
    marioX = int(width * 0.25);
    adversaire.setX(marioX + ecart);
    landscapeSpeed = -2;
  }
  else{
    landscapeSpeed = 2;
  }

  // Gestion des touches de déplacement
  if (keyPressed) {
    if (key == 'a' || key == 'A') { // Déplacement vers la gauche
        if (isJumping) {
            // Déplacer Mario proportionnellement à la vitesse de saut
            marioX -= 20;
        }
        // Déplacement normal lorsque Mario ne saute pas
        else {
            marioX -= marioSpeed;        }
      // Vérifiez si 1/3 de seconde s'est écoulé depuis la dernière modification de cadre
      if (millis() - lastFrameChangeTime > 70) {
        // Décrément cyclique de marioFrame (-1,-2,-3,-1,-2,-3,...)
        marioFrame = (marioFrame % modulo) - 1;
        lastFrameChangeTime = millis(); // Mettez à jour le temps de la dernière modification de cadre
      }
    }
    if (key == 'd' || key == 'D') { // Déplacement vers la droite
        if (isJumping) {
            // Déplacer Mario proportionnellement à la vitesse de saut
            marioX += 20;
        }
        // Déplacement normal lorsque Mario ne saute pas
        else {
            marioX += marioSpeed;
        }
      // Vérifiez si 1/3 de seconde s'est écoulé depuis la dernière modification de cadre
      if (millis() - lastFrameChangeTime > 70) {
        // Décrément cyclique de marioFrame (-1,-2,-3,-1,-2,-3,...)
        marioFrame = (marioFrame % modulo) + 1;
        lastFrameChangeTime = millis(); // Mettez à jour le temps de la dernière modification de cadre
      }
    }
    if(key =='p' || key == 'P'){
      marioFrame = 9;
    }
    if(key == 'o' || key == 'O'){
      marioFrame = -9;
    }
    //if ((key == 'e' || key == 'E') && !isJumping) { // Saut
     // marioFrame = 4;
     // jumpSpeed = jumpForce;
      //isJumping = true;
    //}
    if ((key == 'e' || key == 'E') && !isJumping) { // Saut
      marioFrame = -10;
      isJumping = true;
      jumpSpeed = jumpForce;
      marioY += jumpForce;
    }
    if(key == 'x' || key == 'X'){
      marioFrame = -4;
    }
    if(key == 'y' || key == 'Y'){
      marioFrame = 8;
    }
    if(key == 't' || key == 'T'){
      marioFrame = -8;
    }

  }
  else{
    if (millis() - lastFrameChangeTime > 70) {
          // Décrément cyclique de marioFrame (-1,-2,-3,-1,-2,-3,...)
          marioFrame = (marioFrame % modulo) + 1;
          lastFrameChangeTime = millis(); // Mettez à jour le temps de la dernière modification de cadre
        }
  }
  
  // Gestion du saut
  if (isJumping) {
    marioY += jumpSpeed;
    jumpSpeed += gravity;
    if (marioY >= height - 200) {
      marioY = height - 200;
      isJumping = false;
    }
  }
  
  // Assurez-vous de mettre à jour la position du paysage
  updateLandscape();
}

void updateMarioFrameLeft() {
  if (millis() - lastFrameChangeTime > 70) {
    marioFrame = (marioFrame % modulo) - 1;
    lastFrameChangeTime = millis();
  }
}

void updateMarioFrameRight() {
  if (millis() - lastFrameChangeTime > 70) {
    marioFrame = (marioFrame % modulo) + 1;
    lastFrameChangeTime = millis();
  }

  else{
    if (millis() - lastFrameChangeTime > 140) {
        // Décrément cyclique de marioFrame (-1,-2,-3,-1,-2,-3,...)
        marioFrame = (marioFrame % modulo) + 1;
        lastFrameChangeTime = millis(); // Mettez à jour le temps de la dernière modification de cadre
      }
  }
  
  
  if (isJumping) { // Gestion de la gravité pendant le saut
    marioFrame = 4;
    marioY += jumpSpeed;
    if(keyPressed){
      if(key == 'a' || key == 'A'){
        marioFrame = -10;
      }
      else if(key == 'd' || key == 'D'){
        marioFrame = 10;
      }
    }
    if (jumpSpeed < 0) { // Si Mario monte
      jumpSpeed += gravity; // Appliquer la gravité pour ralentir la montée
    } else { // Si Mario descend
      jumpSpeed += gravity; // Appliquer la gravité pour accélérer la descente
    }
    if (marioY >= height - 200) { // Lorsque Mario touche le sol
      marioY = height -200;
      isJumping = false;
    }
  }
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//

void keyPressed() {
  // Vérifiez si la touche 'j' ou 'J' est enfoncée et si le cooldown est terminé
  if ((key == 'j' || key == 'J') && !jkKeyPressed && millis() - lastJKeyPressTime > keyCooldownDuration) {
    // Effectuez l'action associée à la touche 'j' ou 'J'
    marioFrame = -7;
    marioX -= 75;
    
    // Mettez à jour les variables de suivi du temps et de l'état de la touche 'j' ou 'J'
    jkKeyPressed = true;
    lastJKeyPressTime = millis();
  }
  // Vérifiez si la touche 'k' ou 'K' est enfoncée et si le cooldown est terminé
  else if ((key == 'k' || key == 'K') && !jkKeyPressed && millis() - lastJKeyPressTime > keyCooldownDuration) {
    // Effectuez l'action associée à la touche 'k' ou 'K'
    marioFrame = 7;
    marioX += 75;
    
    // Mettez à jour les variables de suivi du temps et de l'état de la touche 'k' ou 'K'
    jkKeyPressed = true;
    lastJKeyPressTime = millis();
  }
}
void keyReleased() {
  // Réinitialisez l'état de la touche 'j' ou 'J' ('k', 'K') lorsqu'elle est relâchée
  if (key == 'j' || key == 'J') {
    jkKeyPressed = false;
  }
  if (key == 'k' || key == 'K') {
    jkKeyPressed = false;
  }
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//

void drawLandscape() {
  // Dessinez la ligne de paysage
  stroke(255); // Couleur blanche
  strokeWeight(5); // Épaisseur de la ligne
  line(0, (height / 2)+102, width, (height / 2)+102); // Dessinez la ligne de paysage
  
  // Dessinez un carré au-dessus de la ligne de paysage
  fill(100, 100, 255); // Remplissage bleu clair
  rect(landscapePosition + width * 0.5, (height / 2) - 50, 50, 50); // Dessinez un carré au-dessus de la ligne de paysage
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//

// Fonction pour vérifier si une couleur est presque noire
boolean isAlmostBlack(color c, int tolerance) {
  return red(c) <= tolerance && green(c) <= tolerance && blue(c) <= tolerance;
}
// Fonction pour transformer l'image en rendant le fond noir transparent
PImage makeTransparent(PImage img, int tolerance) {
  // Créer une nouvelle image avec un canal alpha
  PImage imgAlpha = createImage(img.width, img.height, ARGB);
  
  // Parcourir chaque pixel de l'image
  img.loadPixels();
  imgAlpha.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    // Vérifier si le pixel est presque noir
    if (isAlmostBlack(c, tolerance)) {
      imgAlpha.pixels[i] = color(0, 0, 0, 0);
    } else {
      // Sinon, copier le pixel original avec une opacité maximale
      imgAlpha.pixels[i] = color(red(c), green(c), blue(c), 255);
    }
  }
  imgAlpha.updatePixels();
  return imgAlpha;
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//
  int displayStartTime = 0;
  boolean displayImage = false;
  
// Fonction pour démarrer l'affichage de l'image pendant une durée spécifiée
void startDisplayImage() {
  displayStartTime = millis();
  displayImage = true;
}
void displayImage(PImage img, float imageX, float imageY, float sizeXImage, float sizeYImage, int duration){
  while(displayImage){
    image(img, imageX, imageY, sizeXImage, sizeYImage);
    // Vérifier si la durée d'affichage est écoulée
    if (millis() - displayStartTime >= duration) {
      displayImage = false; // Arrêter l'affichage de l'image après la durée spécifiée
    }
  }
}
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//
/*class Adversaire {
  PImage image;
  float x, y;
  float speed;
  int frame = 0;
  int lastFrameChangeTime = 0;

  Adversaire() {
    image = null;
//  }
//}
////////////////////////////////////////////_Koopa_////////////////////////////////////////////
class Koopa extends Adversaire {
  PImage koopaLeft0, koopaLeft1, koopaRight0, koopaRight1;
  boolean movingLeft = true;
  //
  Koopa(PImage left0, PImage left1, PImage right0, PImage right1, float startX, float startY, float spd) {
    koopaLeft0 = left0;
    koopaLeft1 = left1;
    koopaRight0 = right0;
    koopaRight1 = right1;
    image = left0;
    x = startX;
    y = startY;
    speed = spd;
  }

  void move(float marioX) {
    if (marioX < x) {
      movingLeft = true;
      x -= speed; // Déplace Koopa vers la gauche
    } else {
      movingLeft = false;
      x += speed; // Déplace Koopa vers la droite
    }
    // Changer d'image toutes les 50 ms
    if (millis() - lastFrameChangeTime > 50) {
      frame = (frame + 1) % 2; // Alterner entre 0 et 1
      lastFrameChangeTime = millis(); // Mettre à jour le temps de la dernière modification de cadre
    }

    // Définir l'image actuelle en fonction de la direction et du cadre
    if (movingLeft) {
      image = (frame == 0) ? koopaLeft0 : koopaLeft1;
    } else {
      image = (frame == 0) ? koopaRight0 : koopaRight1;
    }
  }
  void displayKoopa() {
    image(image, x, y, 100, 100);
  }
}*/
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PImage makeTransparent(PImage img) {
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    if (red(c) > 100 && green(c) < 100 && blue(c) < 100) { // Rouge
      img.pixels[i] = color(255, 255, 0); // Jaune
    } else if (blue(c) > 100 && red(c) < 100 && green(c) < 100) { // Bleu
      img.pixels[i] = color(255); // Blanc
    }
  }
  img.updatePixels();
  return img;
}
//////////////
void updateLandscape() {
  // Logique pour mettre à jour la position du paysage
  landscapeX -= landscapeSpeed;
  if (landscapeX <= -landscape.width) {
    landscapeX += landscape.width;
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Adversaire {
  PImage advImage, stand, walk1, walk2, walk1_, walk2_, kick, punch, tor, walk3, walk4, walk3_, tor_, punch_, kick_;
  float x, y;
  float speed;
  int frame = 0;
  int lastFrameChangeTime = 0;
  boolean posture=false;
  boolean movingLeft = true;
  boolean isJumping = false;
  float jumpForce = -50;
  float jumpSpeed = jumpForce;
  float gravity = 5;
  boolean attack=false;

  Adversaire(float startX, float startY, float spd) {
    stand = liguiStand;
    walk1 = liguiWalk1;
    walk2 = liguiWalk2;
    walk3 = liguiWalk3;
    //walk4 = liguiWalk4;

    walk1_ = liguiWalk1_;
    walk2_ = liguiWalk2_;
    walk3_ = liguiWalk3_;

    kick = liguiKick;
    punch = liguiPunch;
    tor = liguiTor;
    kick_ = liguiKick_;
    punch_ = liguiPunch_;
    tor_ = liguiTor_;
    x = startX;
    y = startY;
    speed = spd;
  }

  void moveTowards(float targetX) {
    if (targetX < x) {
      movingLeft = true;
    } else {
      movingLeft = false;
    }
    updateAdversaireFrame();
  }

  void updateAdversaireFrame() {
    if (millis() - lastFrameChangeTime > 70) {
      frame = (frame + 1) % 3;
      lastFrameChangeTime = millis();
    }
  }

  void display(float targetX) {
    PImage img;
    int action = int(random(6));
    if(!attack){
      if (movingLeft) {
        if(frame == 0){
          img = walk1_;
        }else if(frame == 1){
          img = walk2_;
        }else{
          img = walk3_;
        }
        image(img, x, y, 100, 100);
        advImage = img;
        x -= speed;
      } else {
        if(frame == 0){
          img = walk1;
        }else if(frame == 1){
          img = walk2;
        }else{
          img = walk3;
        }
        image(img, x, y, 100, 100);
        advImage = img;
        x += speed;
      }
    }else{
      if(targetX>x){
        switch (action) {
          case 0:
            startDisplayImage();
            advImage = kick;
            displayImage(kick, x-50, y-30, 160, 100, 300);
            break;
          case 1:
            startDisplayImage();
            advImage = punch;
            displayImage(punch, x + 50, y, 150, 100, 300);
            break;
          case 2:
            image(tor, x+30, y + 30, 150, 70);//TorMario
            startDisplayImage();
            advImage = fire;
            displayImage(fire, x+100, y-120, 280, 220, 1000);
            break;
          default:
            break;
        }
      }else{
        switch (action) {
          case 0:
            startDisplayImage();
            advImage = kick_;
            displayImage(kick_, x-65, y-30, 150, 100, 500);
            break;
          case 1:
            startDisplayImage();
            advImage = punch_;
            displayImage(punch_, x-100, y, 150, 100, 300);
            break;
          case 2:
            image(tor_, x, y+30, 150, 70);//TorMario_
            startDisplayImage();
            advImage = fire;
            displayImage(fire, x-180,y-120, 280, 220, 1000);
            break;
          default:
            startDisplayImage();
            advImage = stand;
            displayImage(stand, x, y, 100, 100, 2000);
            break;
        }
      }
    }
  }
  PImage getAdvImage(){
    return this.advImage;
  }
  float getX() {
    return x;
  }

  void setX(float newX) {
    x = newX;
  }
  void attack(boolean value) {
    this.attack=value;
  }
}

 

////////////////////////////////////////
PImage transformColors(PImage img) {
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    img.pixels[i] = color(255 - red(c), 255 - green(c), 255 - blue(c));
  }
  img.updatePixels();
  return img;
}
//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

PImage createLigui(PImage img){
// Créer une nouvelle image pour stocker le résultat avec le même mode (ARGB) que l'image d'origine
  PImage result = createImage(img.width, img.height, ARGB);

  // Parcourir chaque pixel de l'image
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      color c = img.get(x, y);

      // Vérifier si le pixel est presque rouge
      if (estPresqueRouge(c)) {
        // Changer le pixel en vert
        result.set(x, y, color(0, 255, 0));
      } else {
        // Sinon, garder le pixel original
        result.set(x, y, c);
      }
    }
  }

  // Sauvegarder l'image transformée
  result.save("image_sortie.jpg");

  return result;
}

boolean estPresqueRouge(color c) {
  // Extraire les composantes R, G et B
  float r = red(c);
  float g = green(c);
  float b = blue(c);

  // Définir un seuil pour déterminer si un pixel est presque rouge
  float seuil = 150;

  // Un pixel est considéré comme presque rouge si sa composante rouge est supérieure au seuil
  // et si les composantes verte et bleue sont significativement inférieures à la composante rouge
  return r > seuil && g < seuil / 2 && b < seuil / 2;
}
