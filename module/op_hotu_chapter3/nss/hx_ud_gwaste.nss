//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_gwaste
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fires the wolf pup quest.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444)
    {
        // Only fire if quest is active.
        if(GetLocalInt(GetModule(), "HX_WOLF_QUEST") == 1)
        {
            int x = 0;
            object oPup = GetObjectByTag("hx_winter_wolf_p", x);

            // Pups rescued.
            object oPC = GetFirstPC();
            AddJournalQuestEntry("XP2_Wolves", 30, oPC, TRUE, TRUE);
            SetLocalInt(GetModule(), "HX_WOLF_QUEST", 3);

            //Give non-repeatable XP
            int i2daRow = 61;
            int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
            if (bDuplicate == FALSE)
            {
                SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                Reward_2daXP(oPC, i2daRow);
            }


            while(GetIsObjectValid(oPup))
            {
                SignalEvent(oPup, EventUserDefined(4444));
                x = x + 1;
                oPup = GetObjectByTag("hx_winter_wolf_p", x);
            }
            // Make alpha and wolves unkillable.
            SetPlotFlag(GetObjectByTag("hx_winter_wolf_a"), TRUE);
            // Make wolves unkillable.
            x = 0;
            oPup = GetObjectByTag("hx_winter_wolf", x);

            while(GetIsObjectValid(oPup))
            {
                SetPlotFlag(oPup, TRUE);
                x = x + 1;
                oPup = GetObjectByTag("hx_winter_wolf_p", x);
            }
        }
        else
        {
            int x = 0;
            object oPup = GetObjectByTag("hx_winter_wolf_p", x);

            SetLocalInt(GetModule(), "HX_WOLF_QUEST", 3);

            while(GetIsObjectValid(oPup))
            {
                SignalEvent(oPup, EventUserDefined(5555));
                x = x + 1;
                oPup = GetObjectByTag("hx_winter_wolf_p", x);
            }
        }
    }
}
