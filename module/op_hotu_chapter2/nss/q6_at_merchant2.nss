//::///////////////////////////////////////////////
//:: FileName q6_at_merchant1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/27/2003 5:14:11 PM
//:://////////////////////////////////////////////
void main()
{

    AddJournalQuestEntry("q6_merchant",20,GetPCSpeaker());
    // Give the speaker the items
    object oMerchant = GetNearestObjectByTag("q6_merchant");
    object oPC = GetPCSpeaker();
    AdjustReputation(oPC, oMerchant, -100);
    AdjustReputation(oMerchant, oPC, -100);
    AssignCommand(oMerchant, ClearAllActions());
}
