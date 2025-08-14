//
//  ViewController.swift
//  ten_pizza
//
//  Created by Сергей Храмков on 14.08.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // Массив с названиями пицц
    let pizzas = [
        "римская",
        "овощная",
        "мясная",
        "авганская",
        "пеперони",
        "игристая",
        "домашняя",
        "оригинальная",
        "романтическая",
        "тонкая"
    ]
    
    // Таблица для отображения пицц
    let pizzasTableView = UITableView()
    
    // Вьюха для вставки картинки
    let imageContainerView = UIView()
    
    // UIImageView внутри контейнера
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupImageContainerView()
        setupTableView()
    }
    
    func setupImageContainerView() {
        // Устанавливаем размеры и позицию контейнера
        let containerHeight: CGFloat = 350
        imageContainerView.frame = CGRect(x: 0,
                                          y: view.safeAreaInsets.top,
                                          width: view.bounds.width,
                                          height: containerHeight)
        
        // Настраиваем внешний вид
        imageContainerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        // Добавляем контейнер на главный вид
        view.addSubview(imageContainerView)
        
        // Настраиваем изображение
        imageView.frame = CGRect(x: 10, y: 10, width: imageContainerView.bounds.width - 20, height: containerHeight - 20)
        
        // Загружаем изображение
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "фото")
        
        // Добавляем изображение в контейнер
        imageContainerView.addSubview(imageView)
    }
    
    func setupTableView() {
        // Расчёт кординат
        let tableY = imageContainerView.frame.maxY
        
        // Высота таблицы
        let tableHeight = view.bounds.height - tableY
        
        pizzasTableView.frame = CGRect(x: 0,
                                       y: tableY,
                                       width: view.bounds.width,
                                       height: tableHeight)
        
        pizzasTableView.dataSource = self
        
        // Регистрируем простую ячейку для таблицы
        pizzasTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Добавляем таблицу на главный вид
        view.addSubview(pizzasTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = pizzas[indexPath.row]
        
        return cell
    }
}
