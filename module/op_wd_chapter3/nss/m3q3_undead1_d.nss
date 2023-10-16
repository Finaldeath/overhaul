void main()
{
int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
    case 1007:
        {
                int nDeadSkel = GetLocalInt(GetModule(),"M3Q3UndeadTrap1Killed");
                nDeadSkel = nDeadSkel + 1;
                SetLocalInt(GetModule(),"M3Q3UndeadTrap1Killed",nDeadSkel);
                if(nDeadSkel == 2)
                    {
                        SignalEvent(GetObjectByTag("M3Q3DDPORT1"),EventUserDefined(0));
                        SignalEvent(GetObjectByTag("M3Q3DDPORT2"),EventUserDefined(0));
                    }
        }
    }
}
