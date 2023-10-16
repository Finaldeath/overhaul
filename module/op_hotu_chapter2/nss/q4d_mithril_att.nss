//::///////////////////////////////////////////////
//:: Name x2_def_attacked
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Physically attacked script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if(GetLocalInt(GetArea(OBJECT_SELF), "DO_GOLEM_CUTSCENE_ONCE") == 0)
        return;
    //SignalEvent(OBJECT_SELF, EventUserDefined(101));
    ExecuteScript("nw_c2_default5", OBJECT_SELF);
}
