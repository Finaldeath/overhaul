//* Open Door to ghouls/ghasts if trap triggered
void main()
{
       SignalEvent(GetObjectByTag("M2Q2C1T4Door1"),EventUserDefined(200));
       SignalEvent(GetObjectByTag("M2Q2C1T4Door2"),EventUserDefined(200));
}
