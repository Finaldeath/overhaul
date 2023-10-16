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
    object oCompass = GetItemPossessedBy(oMerchant, "q6_compass");
    DestroyObject(oCompass);
    CreateItemOnObject("q6_compass", GetPCSpeaker());
    ///In the conversation, marks player given compass
    SetLocalInt(GetModule(),"MerchantShard",99);
    SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL", 2);
}
