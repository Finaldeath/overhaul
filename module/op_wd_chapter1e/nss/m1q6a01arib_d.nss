void main()
{
    object oDesther = GetLocalObject(GetArea(OBJECT_SELF),"NW_L_oDesther");
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 601:
        {
            ActionForceMoveToObject(GetNearestObjectByTag("WP_AribethRStart"));
            //DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(610)));
        }
        break;
        case 610:
        {
            SpeakOneLinerConversation("M1Q6A01scene");

            DelayCommand(4.0,SignalEvent(oDesther,EventUserDefined(620)));
            SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(615));
        }
        break;
        case 670:
        {
            SpeakOneLinerConversation("M1Q6A01scene");
            DelayCommand(4.0,SignalEvent(oDesther,EventUserDefined(680)));
        }
        break;
        case 695:
        {
            ActionForceMoveToObject(GetNearestObjectByTag("WP_AribethPortal"),TRUE);
            DestroyObject(GetLocalObject(GetArea(OBJECT_SELF),"NW_L_Blue"));
            ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(699)));
        }
        break;
        case 699:
        {
            if(GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q6A01HelmitesKilled") < 6)
            {
                ActionWait(3.0);
                ActionDoCommand(SpeakOneLinerConversation("M1Q6A01Battle"));
                ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,10.0);
                DelayCommand(10.0,SignalEvent(OBJECT_SELF,EventUserDefined(699)));
            }
        }
        break;
    }
}
