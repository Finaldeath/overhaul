//::///////////////////////////////////////////////
//:: Enter
//:: m2q6RitualSpeak
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start the conversation between Maugrim, Morag
    and Aribeth.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 16, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Activate") == 0)
    {
        if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_Ritual") == 0)
        {
            AssignCommand(GetObjectByTag("M2Q06PMORAG01"),ActionStartConversation(GetObjectByTag("M2Q06PARIBETH01"),"M2Q6AMORA"));
        }
        else if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_Ritual") == 1)
        {
            AssignCommand(GetObjectByTag("M2Q06PMAUGRIM02"),ActionStartConversation(GetObjectByTag("M2Q06PARIBETH02"),"M2Q6AMAUG"));
        }
        else if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_Ritual") == 2)
        {
            AssignCommand(GetObjectByTag("M2Q06PMORAG03"),ActionStartConversation(GetObjectByTag("M2Q06PARIBETH03"),"M2Q6AMORA"));
        }
        SetLocalInt(OBJECT_SELF,"NW_L_Activate",1);
    }
}
