void main()
{
    object oFenthick = GetLocalObject(GetArea(OBJECT_SELF),"NW_L_oFenthick");
    object oAribeth = GetLocalObject(GetArea(OBJECT_SELF),"NW_L_oAribeth");
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 601:
        {
            ActionForceMoveToObject(GetNearestObjectByTag("WP_DestherRStart"));
        }
        break;
        case 620:
        {
            SpeakOneLinerConversation("M1Q6A01scene");
            DelayCommand(4.0,SignalEvent(oFenthick,EventUserDefined(630)));
        }
        break;
        case 640:
        {
            SpeakOneLinerConversation("M1Q6A01scene");
            DelayCommand(4.0,SignalEvent(oFenthick,EventUserDefined(650)));
        }
        break;
        case 660:
        {
           SpeakOneLinerConversation("M1Q6A01scene");
           DestroyObject(GetLocalObject(GetArea(OBJECT_SELF),"NW_L_Red"));
           SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(665));
           DelayCommand(4.0,SignalEvent(oAribeth,EventUserDefined(670)));
        }
        break;
        case 680:
        {
            DelayCommand(2.0,SignalEvent(oFenthick,EventUserDefined(690)));
            SpeakOneLinerConversation("M1Q6A01scene");
            ActionForceMoveToObject(GetNearestObjectByTag("WP_M1Q6APortal"),TRUE,1.0,10.0);
            ActionDoCommand(DestroyObject(OBJECT_SELF));
            SetCommandable(FALSE);

        }
        break;

    }
}
