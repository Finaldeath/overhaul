//::///////////////////////////////////////////////
//:: Start the kobold-jumping sequence (fired from Master-Jumper's dialog)
//:: q5_jumplever
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    for each kobold jumper:
    1. run to the top of the platform.
    2. destroy-self.
    3. Create jumping-kobold spell-effect.
    4. Adjust platform and boulder heights.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 18/2/2003
//:://////////////////////////////////////////////

#include "q5_inc_plot"
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(GetArea(OBJECT_SELF), "Q5_LEVERUSED", 1);
    int i = 7;

    float fWait = 0.0;
    for(i = 7; i >= 1; i--)
    {
        DelayCommand(fWait, SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101)));
        DelayCommand(fWait, AssignCommand(oPC, PlaySound("as_cv_crank1")));
        fWait += 0.5;
    }
    SetPlot("jt_q5blocked", 80, oPC);
}
