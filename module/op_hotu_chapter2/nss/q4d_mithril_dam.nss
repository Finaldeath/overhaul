//::///////////////////////////////////////////////
//:: Name x2_def_ondamage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDamaged script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    //SignalEvent(OBJECT_SELF, EventUserDefined(101));
    if(GetLocalInt(GetArea(OBJECT_SELF), "DO_GOLEM_CUTSCENE_ONCE") == 0)
        return;
    ExecuteScript("nw_c2_default6", OBJECT_SELF);
}
