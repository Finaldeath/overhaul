//::///////////////////////////////////////////////
//:: Lazy the Imp, Fall Asleep (Action Script)
//:: H2a_Lazy_Sleep.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Lazy falls asleep.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

void main()
{
    object oLazy = GetObjectByTag("H2_LazyBody");
    object oWP = GetObjectByTag("WP_Lazy");

    SetLocalInt(GetModule(), "HX_LAZY_AWAKE", FALSE);
    SetLocalInt(OBJECT_SELF, "bAwake", FALSE);

    //AssignCommand(oLazy, SetFacing(GetFacing(oWP)));
    //DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), oLazy));
}
