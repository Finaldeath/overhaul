//::///////////////////////////////////////////////
//:: q3_man_gateused
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The gate opens if it is not locked
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

void main()
{
//    object oPC = GetLastUsedBy();
    if(!GetLocked(OBJECT_SELF)
        && GetLocalInt(OBJECT_SELF,"OS_GATE_OPEN")==0)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN);
        SetLocalInt(OBJECT_SELF,"OS_GATE_OPEN",10);
    }
    else if(GetLocalInt(OBJECT_SELF,"OS_GATE_OPEN")==10)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_CLOSE);
        SetLocalInt(OBJECT_SELF,"OS_GATE_OPEN",0);
    }
}
