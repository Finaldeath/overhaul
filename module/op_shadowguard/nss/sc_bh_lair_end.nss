//End the Jhordak cutscene and make the Bloodhawks attack.

#include "nw_i0_generic"

void main()
{

    // MAKE JHORDAK AND BLOODHAWKS ATTACK
    object oPC = GetPCSpeaker();
    object oJhordak = GetNearestObjectByTag("CT_UNIQ_BH_JHOR", oPC);
    AdjustReputation(oPC, oJhordak, -100);
    int iNth = 1;

    // GET ALL BLOODHAWKS, MAKE HOSTILE, AND MAKE ATTACK
    object oBH = GetNearestObject(OBJECT_TYPE_CREATURE, oPC);
    while (oBH != OBJECT_INVALID)
    {
        if (GetFactionEqual(oBH, oJhordak))
        {
            if (GetArea(oBH) == GetArea(oJhordak))
            {
                if (GetDistanceBetween(oBH, oJhordak) < 10.0)
                {
                    if (GetPlotFlag(oBH) == FALSE)
                    {
                        AssignCommand(oBH, DetermineCombatRound());
                    }
                }
            }
        }

        iNth++;
        oBH = GetNearestObject(OBJECT_TYPE_CREATURE, oPC, iNth);
    }

    //End the cutscene.
    SetCutsceneMode(oPC, FALSE);

    // MAKE JHORDAK ATTACK
    DelayCommand(1.0, SetPlotFlag(oJhordak, FALSE));
    AssignCommand(oJhordak, DetermineCombatRound());
}
