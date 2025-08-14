//
//  ViewController.swift
//  ten_pizza
//
//  Created by Сергей Храмков on 14.08.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
    
    // Создаем таблицу
    let pizzas = [
        "римская",
        "овощная",
        "мясная",
        "авганская",
        "пеперони",
        "игристая",
        "домашняя",
        "оригинальная",
        "романтичесакая",
        "тонкая"
    ]
    let pizzasTableView = UITableView()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    pizzasTableView.frame = view.bounds
    pizzasTableView.dataSource = self
    // Регистрируем простую ячейку
    pizzasTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    // Добавляем таблицу на экран
    view.addSubview(pizzasTableView)
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzas.count
    }

    // Что показывать в строке
    func tableView(_ pizzasTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = pizzasTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = pizzas[indexPath.row]
        return cell
    }
}
