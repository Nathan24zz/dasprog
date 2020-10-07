#include<iostream>
#include<SFML/Graphics.hpp>
#include<SFML/Audio.hpp>
#include<math.h>
#include<vector>
#include<cstdlib>
#include<string>
#include<ctime>
#include"Menu.cpp"
#include"Start.cpp"

using namespace sf;

class Bullet
{
public:
	CircleShape shape;
	Vector2f currVelocity;
	float maxSpeed;

	Bullet(float radius = 5.f)
		: currVelocity(0.f, 0.f), maxSpeed(15.f)
	{
		shape.setRadius(radius);
		shape.setFillColor(Color::Red);
	}
};
//deklarasi varibel
std::string stringscore="", playagain="PLAY AGAIN ?", level;
int score;//untuk menampilkan score
int awal;//untuk memulai game

//deklarasi fungsi
int startGame();
int gameOver();

RenderWindow window;
int main()
{
  score = 0;

  //font
  Font myfont;
    myfont.loadFromFile("../font/BebasNeue-Regular.ttf");

  srand(time(NULL));

	Vector2i centerWindow((VideoMode::getDesktopMode().width / 2)-500, (VideoMode::getDesktopMode().height / 2)-390);
  window.create(VideoMode(1000, 700), "Air Fighter", Style::Titlebar | Style::Close);
	window.setPosition(centerWindow);
  window.setFramerateLimit(60);

  //texture
  Texture background, enemy1, player;

  //load images
  if(!background.loadFromFile("../gambar/wallpaper.png")) return EXIT_FAILURE;
  if(!enemy1.loadFromFile("../gambar/jupiter.png")) return EXIT_FAILURE;
  if(!player.loadFromFile("../gambar/pesawat.png")) return EXIT_FAILURE;

  //sprite
  Sprite Player(player), Enemy1(enemy1), Background(background);

	//Player
  Player.setScale(0.1f,0.1f);
  Player.setOrigin(270.f,50.f);
  //set posisi awal Player
  Player.setPosition(Vector2f(window.getSize().x/2, window.getSize().y - 100.f) );

	//Bullets
	Bullet b1;
	std::vector<Bullet> bullets;

	//Enemy
  Enemy1.setScale(0.2f,0.2f);
	int spawnCounter1 = 0;

	std::vector<Sprite> enemies1;


	//Vectors
	Vector2f playerCenter;
	Vector2f mousePosWindow;
	Vector2f aimDir;
	Vector2f aimDirNorm;

  startGame();
  if (awal==1){
      //untuk mengatur kecepatan enemy, jika score bertambah maka enemy akan bergerak semakin cepat
      float gameSpeed = 1.0f;
      level = "LEVEL : 1";
      //sound untuk awal game
      SoundBuffer gameStart;
        gameStart.loadFromFile("../sound/start.wav");
      Sound GameStart;
        GameStart.setBuffer(gameStart);
        GameStart.play();

      awal--;
    
      window.setMouseCursorVisible(false);
	while (window.isOpen())
	{

    stringscore="SCORE : "+std::to_string(score);
    Text textScore(stringscore, myfont, 30), textLevel(level, myfont, 30);
    textScore.setPosition(5,0);
    textLevel.setPosition(5,30);

		Event event;
		while (window.pollEvent(event))
		{
			if (event.type == Event::Closed)
				window.close();
		}
  
		//Update
		//Vectors
		playerCenter = Vector2f(Player.getPosition());
		mousePosWindow = Vector2f(Mouse::getPosition(window));
		aimDir = mousePosWindow - playerCenter;
		aimDirNorm = aimDir / (float)sqrt(pow(aimDir.x, 2) + pow(aimDir.y, 2));
    // std::cout << aimDir.x << std::endl;
    // std::cout << aimDirNorm.y << std::endl;

		//Player
    //agar Player tidak keluar window
    if (Player.getPosition().x < 35.f || Player.getPosition().x > window.getSize().x-40.f
        || Player.getPosition().y < 0 || Player.getPosition().y > window.getSize().y-100.f)
      {Player.move(0.f,0.f);}
       
    //menggerakkan Player
    if (Player.getPosition().x > 35.f && Keyboard::isKeyPressed(Keyboard::A))
      {Player.move(-6.f, 0.f);}
    if (Player.getPosition().y > 0 && Keyboard::isKeyPressed(Keyboard::W))
      {Player.move(0.f, -6.f);}
    if (Player.getPosition().x < window.getSize().x-40.f && Keyboard::isKeyPressed(Keyboard::D))
      {Player.move(6.f, 0.f);}
    if (Player.getPosition().y < window.getSize().y-100.f && Keyboard::isKeyPressed(Keyboard::S))
      {Player.move(0.f, 6.f);}      

		//Enemies
		if (spawnCounter1 < 20)
			spawnCounter1++;

		if(spawnCounter1 >= 20 && enemies1.size() < 10)
		{
			Enemy1.setPosition(Vector2f(rand() % window.getSize().x, 0.f));
      enemies1.push_back(Enemy1);
			spawnCounter1 = 0;
      // std::cout << enemies1.size() << std::endl;
		}

		//Shooting
		if (Mouse::isButtonPressed(Mouse::Left))
		{
			b1.shape.setPosition(playerCenter);
			b1.currVelocity = aimDirNorm * b1.maxSpeed;
    
			bullets.push_back(Bullet(b1));
		}

		for (int i = 0; i < bullets.size(); i++)
		{
			//Agar peluru dapat bergerak
      bullets[i].shape.move(bullets[i].currVelocity);

			//Menghapus peluru yg keluar dr window
			if (bullets[i].shape.getPosition().x < 0 || bullets[i].shape.getPosition().x > window.getSize().x
				|| bullets[i].shape.getPosition().y < 0 || bullets[i].shape.getPosition().y > window.getSize().y)
			{
				bullets.erase(bullets.begin());
				
			}
			else
			{
				//Mendeteksi tabrakan Enemy dengan Bullet
				for (int k = 0; k < enemies1.size(); k++)
				{
					if (bullets[i].shape.getGlobalBounds().intersects(enemies1[k].getGlobalBounds()))
					{
						bullets.erase(bullets.begin() + i);
						enemies1.erase(enemies1.begin() + k);
            //untuk menambah score
            score = score+1;
						
					}
        }
			}
		}

    //menentukan kecepatan enemy dan level game 
    if(score>=0 && score<10){
      gameSpeed=1.0f;
      level="LEVEL  : 1";
    }
    if(score>=10 && score<25){
      gameSpeed=1.5f;
      level="LEVEL  : 2";
    }
    if(score>=25){
      gameSpeed=2.5f;
      level="LEVEL  : 3";
    }

		//Draw
		window.clear();
    window.draw(Background);
    
    //Draw Enemy
		for (int i = 0; i < enemies1.size(); i++)
		{
      window.draw(enemies1[i]);
      enemies1[i].move(0.f, rand()%5 + gameSpeed);
      
      //mendeteksi tabrakan Enemy dengan Player
      if (Player.getGlobalBounds().intersects(enemies1[i].getGlobalBounds()))
      {
        gameOver();
      }
      
      //me-reset Enemy yg sdh keluar window
      if (enemies1[i].getPosition().y > window.getSize().y)
      {
        enemies1[i].setPosition(Vector2f(rand()%window.getSize().x, 0.f));
      }
		}

    //Draw Player
		window.draw(Player);
    //Draw Bullet
		for (int i = 0; i < bullets.size(); i++)
		{
			window.draw(bullets[i].shape);
		}
    window.draw(textScore);
    window.draw(textLevel);
		window.display();
	}
  
}

	return 0;
}

int startGame(){
  Start start(window.getSize().x, window.getSize().y);

  Texture playButton, backgroundStart;
  if(!playButton.loadFromFile("../gambar/playmenu.png")) return EXIT_FAILURE;
  if(!backgroundStart.loadFromFile("../gambar/wallpaper.png")) return EXIT_FAILURE;

  Sprite PlayButton(playButton), BackgroundStart(backgroundStart);
  PlayButton.setScale(0.6f,0.6f);
  PlayButton.setPosition( (window.getSize().x / 2) - (PlayButton.getGlobalBounds().width / 2),
    (window.getSize().y / 2) - (PlayButton.getGlobalBounds().height / 2));
    
  while(window.isOpen())
  {
    Event event;

    while (window.pollEvent(event))
		{
      if (event.type == Event::Closed){window.close();}
      if ( start.IsSpriteClicked(PlayButton, Mouse::Left, window) ){
        return awal = 1;
      }
    }

    window.clear();
    window.draw(BackgroundStart);
    window.draw(PlayButton);
    start.draw(window);

    window.display();   
  }
  
}

int gameOver(){
  Menu menu(window.getSize().x, window.getSize().y);

  Texture gameover;
  if (!gameover.loadFromFile("../gambar/gameover.jpg")) return EXIT_FAILURE;

  Sprite Gameover(gameover);
    
  SoundBuffer gameOver;
    gameOver.loadFromFile("../sound/crash.wav");
  Sound GameOver;
    GameOver.setBuffer(gameOver);
    GameOver.play();
 
  while (window.isOpen())
  {
    Font myfont;
      myfont.loadFromFile("../font/BebasNeue-Regular.ttf");
      stringscore="YOUR SCORE : "+std::to_string(score);
    Text text(stringscore, myfont, 40);
      text.setFillColor(Color::Blue);
      text.setPosition(5,0);
    Text playAgain(playagain, myfont, 50);
      playAgain.setPosition(410,450);

    Event event;

		while (window.pollEvent(event))
		{
			switch (event.type)
			{
			case Event::KeyReleased:
				switch (event.key.code)
				{
				case Keyboard::Left:
					menu.MoveLeft();
					break;

				case Keyboard::Right:
					menu.MoveRight();
					break;

				case Keyboard::Return:
					switch (menu.GetPressedItem())
					{
					case 0:
						std::cout << "Play again" << std::endl;
            main();
						break;
					case 1:
						std::cout << "Exit" << std::endl;
            window.close();
						break;
					}
					break;
				}

				break;
			case Event::Closed:
				window.close();
				break;
			}
		}

		window.clear();
    window.draw(Gameover);
    window.draw(text);
    window.draw(playAgain);
		menu.draw(window);

		window.display();
  }
}

   
    

    