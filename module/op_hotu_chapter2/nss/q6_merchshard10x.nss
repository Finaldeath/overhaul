//::///////////////////////////////////////////////
//:: q6_MerchShard10x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Sets player knows about merchant's
   mirror shard, but doesn't have it
*/
//:://////////////////////////////////////////////
//:: Created By:  Drew Karpyshyn
//:: Created On:  September 4, 2003
//:://////////////////////////////////////////////


void main()
{
    SetLocalInt(GetModule(),"MerchantShard",10);
    AddJournalQuestEntry("q6_merchant",10,GetPCSpeaker());
}
