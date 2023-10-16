//::///////////////////////////////////////////////
//:: Name q2bs_use_garglev
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Using this lever will lock the corresponding
    gargoyle statue permanently.
    Can only be locked if correctly pointed at the
    door...
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  June 21/03
//:://////////////////////////////////////////////

void DeactivateLever();

void main()
{
    //if the gargoyle statue is locked - do nothing
    string szTag = GetStringLeft(GetTag(OBJECT_SELF),10);
    object oGarg = GetObjectByTag(szTag);
    if (GetLocalInt(oGarg, "nLocked") == 1)
        return;

    if (GetLocalInt(OBJECT_SELF, "nActivated") == 0)
    {
        SetLocalInt(OBJECT_SELF, "nActivated", 1);
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "nActivated", 0);
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }

    //Lock the gargoyle permanently - if the gargoyle is lockable
    if (GetLocalInt(oGarg, "nLockable") == 1)
    {
        SetLocalInt(oGarg, "nLocked", 1);
        //DelayCommand(10.0, SetLocalInt(oGarg, "nLocked", 0));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOBE_MINOR), oGarg);
        //DelayCommand(10.0, DeactivateLever());
    }
}

void DeactivateLever()
{
    if (GetLocalInt(OBJECT_SELF, "nActivated") == 0)
    {
        SetLocalInt(OBJECT_SELF, "nActivated", 1);
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "nActivated", 0);
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
}
