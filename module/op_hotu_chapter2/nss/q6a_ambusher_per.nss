//::///////////////////////////////////////////////
//:: Name x2_def_percept
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Perception script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "AMBUSH_STARTED") == 0)
        return;
    ExecuteScript("nw_c2_default2", OBJECT_SELF);
}
