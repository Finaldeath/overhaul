//::///////////////////////////////////////////////
//:: Aribeth (OnConv)
//:: H2_Ari_OnConv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Prevent Aribeth from rotating toward the
     player while frozen.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2003
//:://////////////////////////////////////////////

void main()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int bThawed = GetLocalInt(oAribeth, "bThawed");
    //
    int iFrozen = GetLocalInt(oAribeth, "HX_FROZEN");

    if (bThawed == FALSE || iFrozen == TRUE)
    {
        float fFacing = GetFacing(OBJECT_SELF);
        SetFacing(fFacing);
    }
    else
    {
        ExecuteScript("x0_ch_hen_conv", OBJECT_SELF);
    }
}
