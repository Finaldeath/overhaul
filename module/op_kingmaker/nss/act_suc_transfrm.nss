//::///////////////////////////////////////////////
//:: act_suc_transfrm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calls the event to transform into a succubus
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

void main()
{
    event eTrans = EventUserDefined(308);
    SignalEvent(OBJECT_SELF,eTrans);
}
