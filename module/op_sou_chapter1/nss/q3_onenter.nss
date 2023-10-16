//q1_onenter_save
//Do single player autosave for this area - the first time entered only

#include "nw_i0_plot"
void main()
{

    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        if (GetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE") != 1)
        {
            SetLocalInt(oPC, "X1_" + GetTag(OBJECT_SELF) + "AUTOSAVE", 1);
            DoSinglePlayerAutoSave();

        }
        if (GetLocalInt(OBJECT_SELF, "nDestroyGnolls") == 1)
            return;
        //Destroy all gnolls when J'Nah is dead
        if (GetLocalInt(GetModule(), "X1_JNAH_STATUS") == 3)
        {
            SetLocalInt(OBJECT_SELF, "nDestroyGnolls", 1);
            object oCheck = GetObjectByTag("Q3_GNOLL_FACTION");
            int nCount = 1;
            object oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oCheck, nCount);

            while (oGnoll != OBJECT_INVALID)
            {
                if (GetAppearanceType(oGnoll) == APPEARANCE_TYPE_GNOLL_WARRIOR || GetAppearanceType(oGnoll) == APPEARANCE_TYPE_GNOLL_WIZ)
                    DestroyObject(oGnoll);
                nCount++;
                oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oCheck, nCount);
            }
            //Deactivate Encounters
            object oEnc1 = GetObjectByTag("Q3GnollsMixedNormal1");
            object oEnc2 = GetObjectByTag("Q3GnollsMixedNormal2");
            object oEnc3 = GetObjectByTag("Q3GnollsMixedNormal3");
            object oEnc4 = GetObjectByTag("Q3GnollsMixedNormal4");
            object oEnc5 = GetObjectByTag("Q3GnollsMixedNormal5");
            SetEncounterActive(FALSE, oEnc1);
            SetEncounterActive(FALSE, oEnc2);
            SetEncounterActive(FALSE, oEnc3);
            SetEncounterActive(FALSE, oEnc4);
            SetEncounterActive(FALSE, oEnc5);
        }
    }
}
