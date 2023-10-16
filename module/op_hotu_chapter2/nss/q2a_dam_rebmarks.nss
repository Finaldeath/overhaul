//:://////////////////////////////////////////////////
//:: q2a_dam_rebswrd
//:: Default OnDamaged handler
/*
    If already fighting then ignore, else determine
    combat round
    if the gates are not yet destroyed - ignore
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{

        //if in combat - let the end of combat round script handle it
        if (GetIsInCombat() == TRUE)
            return;

        object oDamager = GetLastDamager();
        if (GetIsObjectValid(oDamager) == TRUE)
        {
            //if the front gate isn't down yet - do nothing unless we were damaged
            //by an outsider - this should prevent us rushing the gate when hit by arrows
            if (GetLocalInt(GetModule(), "X2_Q2ABattle1_Gate1Open") == 0)
            {
                if (GetRacialType(oDamager) != RACIAL_TYPE_OUTSIDER)
                    return;
            }
            ActionAttack(oDamager);
        }



}
