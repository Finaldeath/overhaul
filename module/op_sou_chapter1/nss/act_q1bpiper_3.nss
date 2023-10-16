//::///////////////////////////////////////////////
//:: Name  act_q1bpiper_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    At this point - commoner 5 will grovel before
    piper
    ..
*/
//:://////////////////////////////////////////////
//:: Created By:   Keith Warner
//:: Created On:   Feb 14/03
//:://////////////////////////////////////////////

void main()
{



    object oFemale = GetObjectByTag("q1g_pip_common5");

    AssignCommand(oFemale, ActionMoveToObject(GetObjectByTag("q1gpiper")));
    AssignCommand(oFemale, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 10.0));

}
