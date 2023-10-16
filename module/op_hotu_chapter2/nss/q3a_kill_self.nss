//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Generic Kill Self (Action Script)
//:: Q3a_Kill_Self.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The NPC dies.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 27, 2003
//:://////////////////////////////////////////////

void main()
{
    effect eDeath = EffectDeath();
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeath, OBJECT_SELF));
    SetLocalInt(GetArea(OBJECT_SELF), "DEVA_KILLED", 1);
}
