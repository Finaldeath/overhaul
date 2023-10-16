#include "NW_I0_Plot"
void main()
{
    object oPC = GetPCSpeaker();
    object oDemon = GetLocalObject(GetModule(),"NW_G_M1Q6Demon");
    AssignCommand(oDemon,ActionStartConversation(oDemon));
    SetLocalInt(OBJECT_SELF,"NW_L_M1Q6F08Banished",TRUE);
    SetLocalLocation(OBJECT_SELF,"NW_L_M1Q6F08Location",GetLocation(oDemon));
    RewardXP("M1Q6_Demon",100,GetPCSpeaker(),ALIGNMENT_GOOD);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1Q6F8Rituals"));
    AddJournalQuestEntry("M1Q6_Demon", 35, oPC);

}
