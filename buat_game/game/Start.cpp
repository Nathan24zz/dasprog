#include "Start.hpp"

bool Start::IsSpriteClicked(sf::Sprite object, sf::Mouse::Button button, sf::RenderWindow &window)
{
  if(sf::Mouse::isButtonPressed(button))
  {
    sf::IntRect tempRect(object.getPosition().x, object.getPosition().y,
    object.getGlobalBounds().width, object.getGlobalBounds().height);

    if(tempRect.contains(sf::Mouse::getPosition(window)))
    {
      return true;
    }
    return false;
  }
}

sf::Vector2i Start::getMousePositon(sf::RenderWindow &window)
{
  return sf::Mouse::getPosition(window);
}


Start::Start(float width, float height)
{
  fontTitle.loadFromFile("../font/AmericanKestrelLaser-r62y.otf");
  title.setFont(fontTitle);
  title.setString("Air Fighter");
  title.setCharacterSize(90);
  title.setFillColor(sf::Color::White);
  title.setPosition(sf::Vector2f(width/2 - 350.f , 20.f));
}

Start::~Start(){ }

void Start::draw(sf::RenderWindow &window){
  window.draw(title);
}





