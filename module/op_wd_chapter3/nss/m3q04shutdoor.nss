// * Stepping on this trigger slams the door shut
void main()
{
    if (GetIsPC(GetEnteringObject()) == TRUE)
    if (GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {
        object oGiant = GetNearestObjectByTag("M4Q4G06_Giant");
        AssignCommand(oGiant, SpeakOneLinerConversation());
        object oDoor = GetNearestObjectByTag("M34G06_LeverDoor");
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE",1);
        AssignCommand(oDoor, ActionCloseDoor(oDoor));
        AssignCommand(oGiant, ClearAllActions());
        AssignCommand(oGiant, ActionMoveToObject(GetNearestObjectByTag("M3Q4G_GiantGoHere")));
    }
}
