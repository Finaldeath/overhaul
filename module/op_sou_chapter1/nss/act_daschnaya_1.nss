//Take the cards from the speaker..and give XP
#include "nw_i0_plot"
void main()
{
    SetPLocalInt(GetPCSpeaker(), "q1i_Katriana_Job", 3);
    SetLocalInt(GetModule(), "q1i_Daschnaya", 1);
    ActionTakeItem(GetItemPossessedBy(GetPCSpeaker(), "q1bcards"), GetPCSpeaker());
    RewardXP("xplow", 100, GetPCSpeaker());
    if (GetLocalInt(GetPCSpeaker(),"X1_PCREFUSEDDASH")==10)
        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_GOOD, 3);

    // set the campaign variable on each party member
    object oMember = GetFirstFactionMember(GetPCSpeaker());
    while (GetIsObjectValid(oMember))
    {
        SetCampaignInt("Daschnaya", "Daschnaya_Has_Cards", 1, oMember);
        oMember = GetNextFactionMember(GetPCSpeaker());
    }
}
