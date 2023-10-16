//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_demonarea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Has the player start the amulet conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 3, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444)
    {
        object oPC = GetFirstPC();

        DelayCommand(1.0, AddJournalQuestEntry("hx_sens_amulet", 20, GetFirstPC(), TRUE, TRUE));
        //Give non-repeatable XP
        int i2daRow = 134;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            DelayCommand(1.0, Reward_2daXP(oPC, i2daRow));
        }
        DelayCommand(1.0, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(1.5, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(1.6, AssignCommand(oPC, ActionStartConversation(oPC, "q4a_morph_conv", TRUE, FALSE)));
    }
}
