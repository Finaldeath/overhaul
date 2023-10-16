//::///////////////////////////////////////////////
//:: The Knower of Names, Aribeth Not Thawed (Condition Script)
//:: H7c_Name_Ari_4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth was never thawed out.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    //If Aribeth isn't thawed, treat that as being dead...
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int bThawed = GetLocalInt(oAribeth, "bThawed");
    if (bThawed == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
