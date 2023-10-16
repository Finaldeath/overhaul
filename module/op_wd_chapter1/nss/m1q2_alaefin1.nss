void main()
{
    object oDoor = GetNearestObjectByTag("m1q2D_m1q2E");
    object oKurdan = GetNearestObjectByTag("m1q2_Kurdan");

    SetLocalInt(oKurdan, "ConversationState", 1);
    DelayCommand(1.0, AssignCommand(oKurdan, SpeakOneLinerConversation()));

    ActionForceMoveToObject(oDoor,FALSE,3.0);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
