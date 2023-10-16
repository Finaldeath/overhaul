//::///////////////////////////////////////////////
//:: Name  act_q1bpiper_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    At this point - destroy the two non-followers
    if they are still around..
*/
//:://////////////////////////////////////////////
//:: Created By:   Keith Warner
//:: Created On:   Feb 14/03
//:://////////////////////////////////////////////

void main()
{
    object oNobMale = GetObjectByTag("q1g_pip_common2");
    object oNobFemale = GetObjectByTag("q1g_pip_common6");
    if (GetIsObjectValid(oNobMale) == TRUE)
    {
        DestroyObject(oNobMale, 6.0);
        AssignCommand(oNobMale, ClearAllActions(TRUE));
        AssignCommand(oNobMale, ActionMoveToObject(GetObjectByTag("wp_pipcommon_5")));
        DelayCommand(1.0, SetCommandable(FALSE, oNobMale));
    }
    if (GetIsObjectValid(oNobFemale) == TRUE)
    {
        DestroyObject(oNobFemale, 6.5);
        AssignCommand(oNobFemale, ClearAllActions(TRUE));
        AssignCommand(oNobFemale, ActionMoveToObject(GetObjectByTag("wp_pipcommon_5")));
        DelayCommand(1.0, SetCommandable(FALSE, oNobFemale));
    }
}
