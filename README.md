# Sample MVP project (Register Form)


## About MVP

MVP or Model View Presenter, better than MVC.

	1. Crear modelo, que operaciones se necesitan
	2. Crear flujo de pantallas
	3. Crear pantallas con sus controles
	4. Crear view datos simulados
	5. Crear presenter con inyeccion de dependencia por constructor del modelo
	6. Crear protocolo de comunicacion con la vista
	7. Agregar delegado de la vista inyeccion de dependencia por funcion
		attachView (delegate: view)
		detachView
		destroy
	8. Agrega en la vista variable delegado por inyeccion de dependencia por variable
	9. Implementar protocolo de comunicacion en la vista
 	10. Crear test para modelo
 	11. Crear test para presenter con pantallas.
 
 Clase Persistences
 Con las funciones basicas de CRUD en CORE DATA para una entidad User
 
 Protocolo BasePresenter
 Con la funciones necesarias minimas para realizar un presente
 
 Es un ejemplo de uso del patron MVC con CORE DATA y se muestra en un UITableViewControler y en UIViewController con un UITableView, navegacion de segue.
