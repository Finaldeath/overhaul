//::///////////////////////////////////////////////
//:: q6e_at_cleric4
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
void main()
{
   AddJournalQuestEntry("q6_temple",20,GetPCSpeaker());

   // Marks player as being told Sabal has mirror shard
    // Destroy Shard on Cleric

    object oShard = GetItemPossessedBy(OBJECT_SELF, "q6_shard");

    DestroyObject(oShard);
    SetLocalInt(OBJECT_SELF, "SHARD", 10);
}

