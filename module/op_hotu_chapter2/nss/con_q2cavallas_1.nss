//::///////////////////////////////////////////////
//:: con_q2cavallas_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if the NPC has been talked to 0 times
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 2, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(),"Valen_Journal")< 10)
        return TRUE;
    return FALSE;
}
