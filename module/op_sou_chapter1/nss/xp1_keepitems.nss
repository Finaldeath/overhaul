// the PC keeps whatever unmentioned items he has

#include "NW_I0_PLOT"

void main()
{
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "x1dragontooth");
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");

    int nPlot1 = GetLocalInt(GetPCSpeaker(), "Tooth_Quest");
    int nPlot2 = GetLocalInt(GetPCSpeaker(), "Hand_Quest");
    int nPlot3 = GetLocalInt(GetPCSpeaker(), "Mask_Quest");

    if ((GetIsObjectValid(oTooth)) && (nPlot1 == 0))
    {
        SetLocalInt(GetPCSpeaker(), "Tooth_Quest", 1);
        AddJournalQuestEntry("q1_artifact_tooth", 45, GetPCSpeaker(), TRUE, FALSE, TRUE);
        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 3);
    }

    if ((GetIsObjectValid(oHand)) && (nPlot2 == 0))
    {
        SetLocalInt(GetPCSpeaker(), "Hand_Quest", 1);
        AddJournalQuestEntry("q1_artifact_hand", 45, GetPCSpeaker(), TRUE, FALSE, TRUE);
        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 3);
    }

    if ((GetIsObjectValid(oMask)) && (nPlot3 == 0))
    {
        SetLocalInt(GetPCSpeaker(), "Mask_Quest", 1);
        AddJournalQuestEntry("q1_artifact_mask", 45, GetPCSpeaker(), TRUE, FALSE, TRUE);
        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 3);
    }
}
