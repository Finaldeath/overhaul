//::///////////////////////////////////////////////
//:: Cutscene 11 (OnAbort)
//:: Abort_Cut11.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle any abortion of opening cutscene, Part
     I (#11).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 2, 2003
//:://////////////////////////////////////////////
#include "inc_cutscene_11"

void main()
{
    int iCutNum = 11;
    float fTimer = 0.0;

    //Wrap up Cutscene 11 for all participating PCs.
    DelayCommand(fTimer, Cut11_EndCutscene());

    //Jump the Thralls back to their starting positions.
    DelayCommand(fTimer, Cut11_ResetActors());

    //Flag Cutscene 11 as no longer active.
    DelayCommand(fTimer, SetLocalInt(GetModule(), "bCut_11_Active", FALSE));
}
