//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_helper_mimic
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Helper dialog for the mimic area.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 24, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444)
    {
        object oPC = GetFirstPC();

        if(GetLocalInt(GetModule(), "HX_MIMIC_HELP") == TRUE)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oPC, ActionStartConversation(oPC, "hx_mimic_h_conv", TRUE, FALSE));
        }
    }
}
