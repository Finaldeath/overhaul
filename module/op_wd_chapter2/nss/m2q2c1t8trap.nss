//* Open Door if trap triggered
void main()
{
       SignalEvent(GetObjectByTag("M2Q2C1T8Door1"),EventUserDefined(200));
       SignalEvent(GetObjectByTag("M2Q2C1T8Door2"),EventUserDefined(200));
}
