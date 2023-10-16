//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3QuintLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Quint leaves and enters the estate.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 29, 2001
//:://////////////////////////////////////////////

void main()
{
    object oQuint = GetObjectByTag("M2Q03CQUINT1");
    int iQuintLeave = GetLocalInt(oQuint, "NW_L_QuintLeave");

    if (iQuintLeave == 0)
    {
        SetLocalInt(oQuint, "NW_L_QuintLeave", 10);
        AssignCommand(oQuint,ActionStartConversation(OBJECT_SELF));
    }
}
