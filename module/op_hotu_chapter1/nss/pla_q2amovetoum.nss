void main()
{
    object oPC = GetLastUsedBy();
    if (GetLocalInt(GetModule(), "NW_WELLROOMOPEN") >= 10 &&
        (GetLocalInt(oPC, "nWellTalk") == 1 || GetLocalInt(GetModule(), "nWellTalk") == 1) )
    {
        ActionStartConversation(oPC,"q2ainnwell");
    }
    else
    {
        AssignCommand(GetObjectByTag("q2adurnan"), ActionStartConversation(oPC));
    }

}
