//::///////////////////////////////////////////////
//:: Cutscene 10 (OnAbort)
//:: Abort_Cut10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle any abortion of opening cutscene, Part
     I (#10).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
#include "inc_cutscene_10"

void main()
{
    int iCutNum = 10;
    float fTimer = 0.0;

    //Jump Thralls back to their starting points.
    Cut10_ResetActors();

    //Destroy Clone of PC.
    object oClone = GetObjectByTag("Cut10_Clone");
    DestroyObject(oClone);

    //Shared End function (but feed in the Undrentide JumpTarget)
    object oJumpTarget = GetObjectByTag("Undrentide_StartLoc");
    JumpCut10ToCut11(oJumpTarget);

    //Flag Cutscene 10 as no longer active.
    SetLocalInt(GetModule(), "bCut_10_Active", FALSE);


}
