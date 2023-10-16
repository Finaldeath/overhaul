//* Open Door to ghouls/ghasts if trap triggered
void main()
{
       SignalEvent(GetObjectByTag("M2Q2C1T5Door1"),EventUserDefined(200));
       SignalEvent(GetObjectByTag("M2Q2C1T5Door2"),EventUserDefined(200));
}
