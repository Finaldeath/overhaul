//::///////////////////////////////////////////////
//:: Shadow Portal Trigger (OnExit)
//:: Ex_TrigShadPort.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Deactivate the Shadow Portal
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 18, 2003
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();

    if (GetIsPC(oExiter) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "ShadowPortalActive", FALSE);
    }
}
