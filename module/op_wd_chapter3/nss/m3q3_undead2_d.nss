void main()
{
int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
    case 1007:
        {
                int nDeadSkel = GetLocalInt(GetModule(),"M3Q3UndeadTrap2Killed");
                nDeadSkel = nDeadSkel + 1;
                SetLocalInt(GetModule(),"M3Q3UndeadTrap2Killed",nDeadSkel);
                if(nDeadSkel == 2)
                    {
                        SignalEvent(GetObjectByTag("M3Q3DDPORT3"),EventUserDefined(0));
                        SignalEvent(GetObjectByTag("M3Q3DDPORT4"),EventUserDefined(0));
                    }
        }
    }
}
