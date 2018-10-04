# Sample MVP project (Register Form)


## About MVP

MVP or Model View Presenter, the most popular android design partern.

<p align="center" width= "50%"><br/><img src="https://d1edrlpyc25xu0.cloudfront.net/kiwari-prod/image/upload/v_RuAVurYg/Screen+Shot+2018-10-04+at+22.33.54.png">


## The Code

Presenter :
Protocol as a bridge to connect 2 classes (presenter and ViewController)

```
protocol RegistrationDelegate{
    func showProgress()
    func hideProgress()
    func registrationDidSucceed()
    func registrationDidFailed(message: String)
}
```

Use extentions to manage protocol implementations : 

```
extension ViewController: RegistrationDelegate{
    func showProgress(){
        
    }
    func hideProgress(){
        
    }
    func registrationDidSucceed(){
        print("succeed")
    }
    func registrationDidFailed(message: String){
        print(message)
    }
}
```