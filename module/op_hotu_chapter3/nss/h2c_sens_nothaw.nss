//::///////////////////////////////////////////////
//:: Sensei Dharvana, Aribeth Never Thawed (Condition Script)
//:: H2c_Sens_NoThaw.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth was never thawed out.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int bThawed = GetLocalInt(oAribeth, "bThawed");
    if (bThawed == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
