//* Open Door to mummy if trap triggered
void main()
{
       SignalEvent(GetObjectByTag("M2Q2C1T6Door1"),EventUserDefined(200));
       SignalEvent(GetObjectByTag("M2Q2C1T6Door2"),EventUserDefined(200));
}
