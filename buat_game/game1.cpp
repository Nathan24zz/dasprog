#include<iostream>
#include<SFML/Graphics.hpp>
#include<math.h>
#include<vector>
#include<cstdlib>
#include<string>

using namespace sf;
class Enemy{
public:
  Enemy(float x, float y ){
    enemyTexture.loadFromFile("gambar/jupiter.png");
    Sprite EnemySprite(enemyTexture);
    EnemySprite.setScale(x,y);
  }
  // char Init(const std::string& ImageFile)
  // {
  //   return enemyTexture.loadFromFile(ImageFile);
  // }  
  
  Texture enemyTexture;
  Sprite EnemySprite;  

  // void setTexture(std::string ImageFile){
  //   enemyTexture.loadFromFile(ImageFile);
  //   std::cout << ImageFile;
  // }

};

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

int main()
{
	srand(time(NULL));

  RenderWindow window;
	Vector2i centerWindow((VideoMode::getDesktopMode().width / 2)-500, (sf::VideoMode::getDesktopMode().height / 2)-390);
  window.create(VideoMode(1000, 700), "Air Fighter", Style::Titlebar | sf::Style::Close);
	window.setPosition(centerWindow);
  window.setFramerateLimit(60);

  //texture
  Texture background, /*enemy*/ player;

  //load images
  if(!background.loadFromFile("gambar/wallpaper.png")) return EXIT_FAILURE;
  // if(!enemy.loadFromFile("gambar/jupiter.png")) return EXIT_FAILURE;
  if(!player.loadFromFile("gambar/pesawat.png")) return EXIT_FAILURE;

  //sprite
  Sprite Player(player), /*Enemy(enemy)*/ Background(background);

	//Player
  Player.setScale(0.1f,0.1f);
  Player.setOrigin(270.f,50.f);
  //set posisi awal Player
  Player.setPosition(Vector2f(window.getSize().x/2, window.getSize().y - 100.f) );

	//Bullets
	Bullet b1;
	std::vector<Bullet> bullets;

	//Enemy
  Enemy enemy1(0.2f, 0.2f);
  
  //enemy1.setTexture("gambar/jupiter.png");
  int spawnCounter1 = 0;
	std::vector<Enemy> enemies;

	//Vectors
	Vector2f playerCenter;
	Vector2f mousePosWindow;
	Vector2f aimDir;
	Vector2f aimDirNorm;

	while (window.isOpen())
	{
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

		if(spawnCounter1 >= 20 && enemies.size() < 20)
		{
      enemy1.EnemySprite.setPosition(Vector2f(rand() % window.getSize().x, 0.f));
      enemies.push_back(Enemy(enemy1));
      spawnCounter1 = 0;
			spawnCounter1 = 0;
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
				for (int k = 0; k < enemies.size(); k++)
				{
					if (bullets[i].shape.getGlobalBounds().intersects(enemies[k].EnemySprite.getGlobalBounds()))
					{
						bullets.erase(bullets.begin() + i);
						enemies.erase(enemies.begin() + k);
						break;
					}
        }
			}
		}

		//Draw
		window.clear();
    window.draw(Background);
    
    //Draw Enemy
		for (int i = 0; i < enemies.size(); i++)
		{
      window.draw(enemies[i].EnemySprite);
      enemies[i].EnemySprite.move(0.f, rand()%5 + 1);
      //mendeteksi tabrakan Enemy dengan Player
      if (Player.getGlobalBounds().intersects(enemies[i].EnemySprite.getGlobalBounds()))
      {
        window.close();
      }
      
      //me-reset Enemy yg sdh keluar window
      if (enemies[i].EnemySprite.getPosition().y > window.getSize().y)
      {
        enemies[i].EnemySprite.setPosition(Vector2f(rand()%window.getSize().x, 0.f));
      }
		}

    //Draw Player
		window.draw(Player);
    //Draw Bullet
		for (int i = 0; i < bullets.size(); i++)
		{
			window.draw(bullets[i].shape);
		}
    
		window.display();
	}

	return 0;
}