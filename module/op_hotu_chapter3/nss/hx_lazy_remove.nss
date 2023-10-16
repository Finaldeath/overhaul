//::///////////////////////////////////////////////
//:: Name hx_lazy_remove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Removes effects on Lazy
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 17, 2003
//:://////////////////////////////////////////////
void SetupLazy()
{
    object oLazy = GetObjectByTag("H2_LazyBody");
    effect eEffect = GetFirstEffect(oLazy);

    while(GetIsEffectValid(eEffect))
    {
        if(GetEffectCreator(eEffect) == GetModule())
        {
            // Debug.
            //SendMessageToPC(GetFirstPC(), "Removed");
            RemoveEffect(oLazy, eEffect);
        }
        eEffect = GetNextEffect(oLazy);
    }
}

void main()
{
    object oGrinder5 = GetObjectByTag("QuarryGrinder5");

    if(GetLocalInt(oGrinder5, "bActivated") == FALSE)
    {
        if(GetLocalInt(OBJECT_SELF, "nDoOnce") == FALSE)
        {
            SetLocalInt(OBJECT_SELF, "nDoOnce", TRUE);
            SetupLazy();
        }
    }
}
