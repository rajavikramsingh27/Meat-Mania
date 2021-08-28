import JGProgressHUD

let hud = JGProgressHUD(style: JGProgressHUDStyle.light)

enum loader_option : String {
    case load_start
    case load_stop
    case Error_show
    case Success_show
}

extension UIViewController {
    func loader(type : loader_option,message: String){
        let HUD = JGProgressHUD(style: JGProgressHUDStyle.light)
        
        if type == .Error_show {
            HUD.textLabel.text = message
            HUD.indicatorView = JGProgressHUDErrorIndicatorView() //JGProgressHUDSuccessIndicatorView is also available
            HUD.show(in: view)
            HUD.dismiss(afterDelay: 1.4)
            
        }else if type == .load_start || type == .load_stop{
            if type == .load_stop{
                hud.dismiss()
            }else{
                hud.textLabel.text = "Loading"
                hud.show(in: self.view)
            }
        }else if type == .Success_show{
            HUD.textLabel.text = message
            
            HUD.indicatorView = JGProgressHUDSuccessIndicatorView() //JGProgressHUDSuccessIndicatorView is also available
            HUD.show(in: view)
            HUD.dismiss(afterDelay: 1.4)
            
        }
    }
}
