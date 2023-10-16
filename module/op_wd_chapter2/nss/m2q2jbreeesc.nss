#include "nw_i0_plot"

void main()
{
    object oPC = GetPCSpeaker();
    int iDruidState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q2_Druids");

    switch (iDruidState)
    {
        case 0:
        case 10:
            AddJournalQuestEntry("m2q2_Druids", 20, oPC);
        break;

        case 20:
            AddJournalQuestEntry("m2q2_Druids", 30, oPC);
        break;

        case 30:
            AddJournalQuestEntry("m2q2_Druids", 40, oPC);
        break;
    }

    RewardXP("m2q2_Bree", 100, oPC, ALIGNMENT_GOOD);

    SetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID2",1);
    ActionMoveAwayFromObject(oPC);
    DelayCommand(5.0,ClearAllActions());
    DelayCommand(5.0,JumpToObject(GetWaypointByTag("WP_M2Q2E_BREE")));
    DelayCommand(5.0,SetLocalInt(GetModule(),"NW_M2Q2E_LFINDDRUID2",2));
}
