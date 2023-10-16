//::///////////////////////////////////////////////
//:: Aribeth, Pre-Attack (Condition Script)
//:: H2c_Ari_Attack.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if this line has not been
     spoken before.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bPreAttackDoOnce");
    //if (bDoOnce == FALSE && GetLocalInt(GetModule(), "HX_ARIBETH_ATTACKS") != TRUE)
    if (bDoOnce == FALSE)
    {
        //SetLocalInt(OBJECT_SELF, "bPreAttackDoOnce", TRUE);
        SetLocalInt(GetModule(), "HX_ARIBETH_ATTACKS", TRUE);
        return TRUE;
    }
    return FALSE;
}
