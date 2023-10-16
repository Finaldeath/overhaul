// Action taken for Gishnak: gnolls give safe passage AND chief gives key AND gnolls help

/*
values for Q3_GNOLL_STATUS:

GNOLL_STATUS_INIT =             initial status
GNOLL_STATUS_LEFT =             all gnoll left the area
GNOLL_STATUS_DEAD =             chief is dead
GNOLL_STATUS_SAFE_PASSAGE =     gnollsgave safe passge
GNOLL_STATUS_CONTROL_TRIBE =     player has full control over the tribe

values for Q3_GNOLL_HELP

GNOLL_NOHELP
GNOLL_HELP
*/

#include "q3_inc_plot"

void main()
{
    SetLocalInt(GetModule(), "Q3_GNOLL_STATUS", GNOLL_STATUS_SAFE_PASSAGE);
    SetLocalInt(GetModule(), "Q3_GNOLL_HELP", GNOLL_HELP);
    object oKey = GetItemPossessedBy(OBJECT_SELF, "Q3_KEY_CHIEF");
    object oPC = GetPCSpeaker();
    ActionGiveItem(oKey, oPC);
    object oGnoll = GetObjectByTag("Q3_GNOLL_FACTION"); // use this object to adjust the reputation of all other gnolls
    AdjustReputation(oPC, oGnoll, 50);
    AdjustReputation(oGnoll, oPC, 50);
    //Turn off encounters
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
