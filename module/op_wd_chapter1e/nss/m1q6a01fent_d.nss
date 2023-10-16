void main()
{
    object oDesther = GetLocalObject(GetArea(OBJECT_SELF),"NW_L_oDesther");
    object oAribeth = GetLocalObject(GetArea(OBJECT_SELF),"NW_L_oAribeth");
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 601:
        {
            ActionForceMoveToObject(GetNearestObjectByTag("WP_FenthickRStart"));
        }
        break;
        case 630:
        {
            SpeakOneLinerConversation("M1Q6A01scene");
            DelayCommand(4.0,SignalEvent(oDesther,EventUserDefined(640)));
            int nNth = 1;
            object oTyrran = GetNearestObjectByTag("M1Q6A01Priest",OBJECT_SELF,nNth);
            while(GetIsObjectValid(oTyrran))
            {
                SetPlotFlag(oTyrran,FALSE);
                nNth++;
                oTyrran = GetNearestObjectByTag("M1Q6A01Priest",OBJECT_SELF,nNth);
            }
        }
        break;
        case 650:
        {
            SpeakOneLinerConversation("M1Q6A01scene");
            DelayCommand(4.0,SignalEvent(oDesther,EventUserDefined(660)));
        }
        break;
        case 690:
        {

            SignalEvent(oAribeth,EventUserDefined(695));
            DestroyObject(GetLocalObject(GetArea(OBJECT_SELF),"NW_L_Purple"));
            ActionForceMoveToObject(GetObjectByTag("WP_M1Q6APortal"),TRUE);
            ActionDoCommand(SpeakOneLinerConversation("M1Q6A01scene"));
            ActionDoCommand(DestroyObject(OBJECT_SELF,2.0));
            SetCommandable(FALSE);
        }
    }
}
