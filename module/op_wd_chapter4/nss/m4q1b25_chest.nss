//::///////////////////////////////////////////////
//:: M4Q1B25_CHEST
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Chest only opens if Maugrim and servants are dead
      This script is on the chest OnOpen
      and the trigger OnEnter
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{

    if (GetLocked(GetObjectByTag("M4Q1B26")) == TRUE)
    {
        object oMaug = GetObjectByTag("M4Q01B26MAUG");
        object oFlesh = GetObjectByTag("M4Q1B26Servant");

        int bFleshDead = TRUE;

        // * Flesh golems must be valid and alive to be alive
        if (GetIsObjectValid(oFlesh) == TRUE && GetIsDead(oFlesh) == FALSE)
        {
            bFleshDead = FALSE;
        }
        if(!GetIsObjectValid(oMaug) && bFleshDead == TRUE)
        {
            PlayOldTheme();
            if (GetLocalInt(GetModule(), "NW_G_REWARDMAUGRIMXP") == 0)
            {
                RewardXP("M4Maugrim", 100, GetFirstPC());
                SetLocalInt(GetModule(), "NW_G_REWARDMAUGRIMXP", 10);
            }
            SetLocked(GetObjectByTag("M4Q1B26"),FALSE);
            // * if someone is actually trying to open the chest then
            // *open it for them
            if (GetIsObjectValid(GetLastUsedBy()) == TRUE)
            {
                AssignCommand(GetLastUsedBy(), ActionInteractObject(GetObjectByTag("M4Q1B26")));
            }
        }
        }
}
