//:://////////////////////////////////////////////
/*
    Updates and closes the Missing Beggar's Nest Guard quest log
    when Walters dies.
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: May 28, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "NW_O2_CONINCLUDE"
#include "NW_I0_Plot"
void main()
{
    object oKiller = GetLastKiller();
    SetLocalInt(GetModule(),"NW_G_M1Q5WaltersNowDead",TRUE);
    if (GetIsObjectValid(oKiller) == TRUE)
    {
        // * If I have a master then use him to determine who gets the journal
        if (GetIsObjectValid(GetMaster(oKiller)) == TRUE)
        {
            oKiller = GetMaster(oKiller);
        }
         // * generate boss treasure
        if (GetIsPC(oKiller))
        {
            int iWaltersState = GetLocalInt(oKiller, "NW_JOURNAL_ENTRYM1Q5_Ergus");
            if (iWaltersState >= 10)
            {
                AddJournalQuestEntry("M1Q5_Ergus", 60, oKiller);
            }
        }
    }
}
