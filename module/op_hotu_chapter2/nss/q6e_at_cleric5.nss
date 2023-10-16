//::///////////////////////////////////////////////
//:: q6e_at_cleric5
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On:September 8, 2003
//:://////////////////////////////////////////////
void main()
{
   AddJournalQuestEntry("q6_temple",98,GetPCSpeaker());

   // Give the speaker the cure

    object oCure = GetItemPossessedBy(OBJECT_SELF, "q6e_cure");

       DestroyObject(oCure);


    CreateItemOnObject("q6e_cure", GetPCSpeaker(), 1);

    SetLocalInt(OBJECT_SELF, "STATUS", 5);

}

