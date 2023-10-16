//::///////////////////////////////////////////////
//:: q6_MerchShard10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if player knows about merchant's
   mirror shard, but doesn't have it
*/
//:://////////////////////////////////////////////
//:: Created By:  Drew Karpyshyn
//:: Created On:  September 4, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),("MerchantShard"));
    return iResult == 10 || iResult == 99;
}
