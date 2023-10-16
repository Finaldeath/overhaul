//::///////////////////////////////////////////////
//:: Name q2d7_hb_blueglad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    There is a 30% chance of a signal being sent
    that controls the cutscene camera.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if (Random(3) == 2)
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102));
    ExecuteScript("nw_c2_default1", OBJECT_SELF);
}
