//* Open Door to skeletons if trap triggered
void main()
{
       SignalEvent(GetObjectByTag("M2Q2C1T7Door1"),EventUserDefined(200));
       SignalEvent(GetObjectByTag("M2Q2C1T7Door2"),EventUserDefined(200));
}
