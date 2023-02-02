abstract class CounterStates {}
class CounterInitialState extends CounterStates {}
class CounterPlusState extends CounterStates
{
  final counter ;

  CounterPlusState(this.counter);
}
class CounterMinusState extends CounterStates
{
  final counter ;

  CounterMinusState(this.counter);
}