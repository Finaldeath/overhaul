//::///////////////////////////////////////////////
//:: Name  act_q1bpiper_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    At this point - destroy the female non-followers
    ..
*/
//:://////////////////////////////////////////////
//:: Created By:   Keith Warner
//:: Created On:   Feb 14/03
//:://////////////////////////////////////////////

void main()
{

    object oNobFemale = GetObjectByTag("q1g_pip_common6");
    object oWay = GetWaypointByTag("wp_pipcommon_6");

    DestroyObject(oNobFemale, 6.5);
    AssignCommand(oNobFemale, ClearAllActions(TRUE));
    AssignCommand(oNobFemale, ActionMoveToObject(GetWaypointByTag("wp_pipcommon_6")));
    DelayCommand(1.0, SetCommandable(FALSE, oNobFemale));
    //Have piper face the PC for his next line
    //DelayCommand(1.0, AssignCommand(OBJECT_SELF, SetFacingPoint(GetPosition(GetPCSpeaker()))));
}
