//::///////////////////////////////////////////////
//:: Lazy the Imp, Wake Up (Action Script)
//:: H2a_Lazy_Wake.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Lazy wakes up.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////
void ClearLazy()
{
    object oLazy = GetObjectByTag("H2_LazyBody");
    object oPC = GetPCSpeaker();

    effect eEffect = GetFirstEffect(oLazy);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oLazy, eEffect);
        eEffect = GetNextEffect(oLazy);
    }
    DelayCommand(0.2, AssignCommand(oLazy, SetFacingPoint(GetPosition(oPC))));
}
void main()
{
    SetLocalInt(GetModule(), "HX_LAZY_AWAKE", TRUE);
    SetLocalInt(OBJECT_SELF, "bAwake", TRUE);
    //ClearLazy();
}
