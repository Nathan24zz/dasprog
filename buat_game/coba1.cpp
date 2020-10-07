#include <iostream>
#include <SFML/Graphics.hpp>


int main() {
	sf::RenderWindow window;

	sf::Vector2i centerWindow((sf::VideoMode::getDesktopMode().width / 2)-450, (sf::VideoMode::getDesktopMode().height / 2)-390);

	window.create(sf::VideoMode(800, 700), "SFML Tutorial", sf::Style::Titlebar | sf::Style::Close);
	window.setPosition(centerWindow);

	window.setKeyRepeatEnabled(true);

	//Main Loop:
	while (window.isOpen()) {

		sf::Event Event;

		//Event Loop:
		while (window.pollEvent(Event)) {
      if (Event.type == sf::Event::Closed){
        window.close();
      }
		
      if (sf::Event::EventType::MouseMoved){
        plane.setPos(sf::Vector2f(Event.mouseMove.x, Event.mouseMove.y));
      }
      
      if (sf::Mouse::isButtonPressed(sf::Mouse::Left)){
        isFiring = true;
      }			
		}

		window.clear();
		if (isFiring == true) {
			Bullet newBullet(sf::Vector2f(50, 5));
			newBullet.setPos(sf::Vector2f(plane.getX(), plane.getY()));
			bulletVec.push_back(newBullet);
			isFiring = false;
		}

		for (int i = 0; i < bulletVec.size(); i++) {
			bulletVec[i].draw(window);
			bulletVec[i].fire(3);
		}

		for (int i = 0; i < bulletVec.size(); i++) {
			enemy.checkColl(bulletVec[i]);
		}

		plane.draw(window);
		enemy.draw(window);
		window.display();
	}
}