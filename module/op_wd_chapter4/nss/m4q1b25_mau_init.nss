//::///////////////////////////////////////////////
//:: M4Q1B25_MAU_INIT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets Maugrim to start conversation.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetIsPC(GetEnteringObject()) && GetLocalInt(OBJECT_SELF, "NW_L_DO_ONCE") == 0)
    {
        SetLocalInt(OBJECT_SELF, "NW_L_DO_ONCE", 10);
        object oPC = GetEnteringObject();
        object oMaugrim = GetObjectByTag("M4Q01B26MAUG");
        AssignCommand(oPC,ClearAllActions());
        AssignCommand(oMaugrim,ActionStartConversation(oPC));
    }
}
