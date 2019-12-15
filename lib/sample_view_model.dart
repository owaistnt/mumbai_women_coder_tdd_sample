
class SampleViewModel{

  void setAction(Events events){

  }

  States getCurrentState(){

  }




}


enum Events{ Login, Logout, Signup, Done}
enum States{Initial, Loading, Success, Error, Sighup}

void main(){

  var vm=SampleViewModel();
  vm.getCurrentState();
  vm.setAction(Events.Login);
  vm.getCurrentState();

}