//::///////////////////////////////////////////////
//:: os_mw_abortconv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Restarts the conversation with the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();

    if(GetLocalInt(OBJECT_SELF, "OS_MW_LEVELLING")==10)
    {
        DestroyObject(OBJECT_SELF);
        SetCutsceneMode(oPC, FALSE);
    }
    else
    {
        object oPC = GetFirstPC();
        AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(0.5f, ActionStartConversation(oPC));
    }
}
