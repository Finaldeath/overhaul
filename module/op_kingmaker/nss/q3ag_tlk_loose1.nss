//::///////////////////////////////////////////////
//:: q3ag_tlk_loose1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts a conversation with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: July 29, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    if(GetLocalInt(OBJECT_SELF,"Q3AG_LOOSE1")!=1)
    {

        AssignCommand(oPC,ClearAllActions(TRUE));
        DelayCommand(0.5,ActionStartConversation(oPC));
    }
}
