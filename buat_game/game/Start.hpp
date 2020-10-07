#pragma once
#include<SFML/Graphics.hpp>


class Start
{
public:
	Start(float width, float height);
	~Start();

	void draw(sf::RenderWindow &window);
	bool IsSpriteClicked (sf::Sprite object, sf::Mouse::Button button, sf::RenderWindow &window);
  sf::Vector2i getMousePositon(sf::RenderWindow &window);

private:
  sf::Font fontTitle;
	sf::Text title;
};