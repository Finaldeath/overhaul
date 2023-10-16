// * This trigger should stop the player in his tracks
// * so that Morag has time to deliver her end game speech.
void main()
{
    object oEnter = GetEnteringObject();
    if (GetIsObjectValid(oEnter) == TRUE && GetIsPC(oEnter) == TRUE && GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {
        AssignCommand(oEnter, ClearAllActions());
        AssignCommand(GetNearestObjectByTag("M4Q01D08MORA"), ActionStartConversation(oEnter));
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE", 10);
        SetLocalInt(GetModule(), "NW_G_MORAGINITTRIG",10);
    }
}
