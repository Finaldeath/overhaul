void main()
{
    object oDryad = GetNearestObjectByTag("M1Q0EDryad");
    switch(GetUserDefinedEventNumber())
    {
        case 10:
        {
            SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q0CutScene",10);
            SpeakOneLinerConversation("M1Q0EFinal");
            DelayCommand(2.0,SignalEvent(oDryad,EventUserDefined(20)));
        }
    }
}
