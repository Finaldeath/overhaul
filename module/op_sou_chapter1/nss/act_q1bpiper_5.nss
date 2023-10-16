//::///////////////////////////////////////////////
//:: Name  act_q1bpiper_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    At this point - commoner 2 will leave
    ..
*/
//:://////////////////////////////////////////////
//:: Created By:   Keith Warner
//:: Created On:   Feb 14/03
//:://////////////////////////////////////////////

void main()
{

    object oCommon = GetObjectByTag("q1g_pip_common2");
    DestroyObject(oCommon, 6.0);
    AssignCommand(oCommon, ClearAllActions());
    AssignCommand(oCommon, ActionMoveToObject(GetObjectByTag("wp_pipcommon_5")));
    DelayCommand(1.0, SetCommandable(FALSE, oCommon));


}
