#include "Menu.hpp"

Menu::Menu(float width, float height)
{
	font.loadFromFile("../font/BebasNeue-Regular.ttf"); 
	
	menu[0].setFont(font);
  menu[0].setCharacterSize(50);
	menu[0].setFillColor(sf::Color::Red);
	menu[0].setString("<<YES>>");
	menu[0].setPosition(sf::Vector2f(width / (MAX_NUMBER_OF_ITEMS + 1 ) * 1 + 30, height / 2 + 170));

	menu[1].setFont(font);
  menu[1].setCharacterSize(50);
	menu[1].setFillColor(sf::Color::White);
	menu[1].setString("NO");
	menu[1].setPosition(sf::Vector2f(width / (MAX_NUMBER_OF_ITEMS + 1 ) * 2 - 50, height / 2 + 170));

	selectedItemIndex = 0;
}


Menu::~Menu()
{
}

void Menu::draw(sf::RenderWindow &window)
{
	for (int i = 0; i < MAX_NUMBER_OF_ITEMS; i++)
	{
		window.draw(menu[i]);
	}
}

void Menu::MoveLeft()
{
	if (selectedItemIndex > 0)
	{
    menu[selectedItemIndex].setString("NO");
		menu[selectedItemIndex].setFillColor(sf::Color::White);
		selectedItemIndex--;
    menu[selectedItemIndex].setString("<<YES>>");
		menu[selectedItemIndex].setFillColor(sf::Color::Red);
	}
  else 
  {
    menu[selectedItemIndex].setString("YES");
    menu[selectedItemIndex].setFillColor(sf::Color::White);
    selectedItemIndex=1;
    menu[selectedItemIndex].setString("<<NO>>");
    menu[selectedItemIndex].setFillColor(sf::Color::Red);
  }
}

void Menu::MoveRight()
{
	if (selectedItemIndex + 1 < MAX_NUMBER_OF_ITEMS)
	{
    menu[selectedItemIndex].setString("YES");
		menu[selectedItemIndex].setFillColor(sf::Color::White);
		selectedItemIndex++;
    menu[selectedItemIndex].setString("<<NO>>");
		menu[selectedItemIndex].setFillColor(sf::Color::Red);
	}
  else 
  {
    menu[selectedItemIndex].setString("NO");
    menu[selectedItemIndex].setFillColor(sf::Color::White);
    selectedItemIndex=0;
    menu[selectedItemIndex].setString("<<YES>>");
    menu[selectedItemIndex].setFillColor(sf::Color::Red);
  }
}